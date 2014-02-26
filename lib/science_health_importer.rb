require 'cskit'
require 'cskit/science_health'
require 'twitter_cldr'
require 'pathname'

# Disallow breaks after ". number" (and a few others).
# Probably should be easier to add ULI exceptions in TwitterCldr...
class ScienceHealthBreakIterator < TwitterCldr::Shared::BreakIterator

  def exceptions_for(locale, boundary_name)
    self.class.exceptions_resource_cache[locale] ||=
      super + (1..9).map { |i| ". #{i}" } + ["St."]
  end

end

class ScienceHealthImporter
  class << self

    include CSKit::Readers
    WORD_LIST = File.read(Pathname(__FILE__).dirname.join("wordlist.txt")).split("\r\n")

    def import(by_paragraph = true)
      volume = CSKit.get_volume(:science_health)
      reader = ScienceHealthReader.new(volume)
      break_iter = ScienceHealthBreakIterator.new(:en)

      puts(if by_paragraph
        "Splitting by paragraph."
      else
        "Splitting by sentence."
      end)

      clear_table("phrases")

      reader.each_paragraph(1, "vi") do |paragraph|
        $stdout.write("\rProcessing page #{paragraph.page_start}... ")
        paragraph_text = fix_hyphens(paragraph.lines.map(&:text).join(" "))

        texts = if by_paragraph
          [paragraph_text]
        else
          break_iter.each_sentence(paragraph_text).to_a.map { |s| s.strip }
        end

        texts.each do |text|
          cur_phrase = Phrase.create(
            key: text,
            page: paragraph.page_start
          )
        end

        # Uncomment to only seed the first chapter
        if paragraph.page_start == "18"
          break    
        end
        
      end

      puts "done."
    end

    private

    def clear_table(table)
      if Rails.env.development?
        ActiveRecord::Base.connection.execute(
          "delete from `#{table}`; delete from sqlite_sequence where name='#{table}';"
        )
      else
        ActiveRecord::Base.connection.execute(
          "truncate table `#{table}`;"
        )
      end
    end

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

  end
end
