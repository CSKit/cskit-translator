require 'cskit'
require 'cskit/science_health'
require 'twitter_cldr'
require 'pathname'

include CSKit::Readers

# Do this hacky thing to disallow breaks after ". number" (and a few others).
# Probably should be easier to add ULI exceptions in TwitterCldr...
module TwitterCldr
  module Shared
    class BreakIterator

      private

      def exceptions_for_with_extras(locale, boundary_name)
        exceptions_for_without_extras(locale, boundary_name) +
          (1..9).map { |i| ". #{i}" } +
          ["St."]
      end

      alias_method :exceptions_for_without_extras, :exceptions_for
      alias_method :exceptions_for, :exceptions_for_with_extras

    end
  end
end

WORD_LIST = File.read(Pathname(__FILE__).dirname.join("wordlist.txt")).split("\r\n")

def fix_hyphens(text)
  text.gsub(/\-\s+/, "-").split(" ").map do |word|
    if word.include?("-")
      candidate = word.gsub("-", "")
      clean_candidate = candidate.gsub(/[\.\-_,;]/, "").downcase
      if WORD_LIST.include?(clean_candidate)
        candidate
      else
        word
      end
    else
      word
    end
  end.join(" ")
end

volume = CSKit.get_volume(:science_health)
reader = ScienceHealthReader.new(volume)

# clear all existing phrases
if Rails.env.development?
  Phrase.delete_all
  ActiveRecord::Base.connection.execute(
    "delete from sqlite_sequence where name='phrases';"
  )
else
  ActiveRecord::Base.connection.execute(
    "truncate table phrases;"
  )
end

if ARGV[0] == "-p"
  puts "Splitting by paragraph."
else
  puts "Splitting by sentence."
end

reader.each_paragraph(1, "vi") do |paragraph|
  $stdout.write("\rProcessing page #{paragraph.page_start}... ")
  paragraph_text = fix_hyphens(paragraph.lines.map(&:text).join(" "))

  texts = if ARGV[0] == "-p"
    [paragraph_text]
  else
    paragraph_text.localize.each_sentence.to_a.map { |s| s.to_s.strip }
  end

  texts.each do |text|
    cur_phrase = Phrase.create(
      key: text,
      page: paragraph.page_start
    )
  end
end

puts "done."
