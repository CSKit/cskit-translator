require 'cskit'
require 'cskit/science_health'
require 'twitter_cldr'

include CSKit::Readers

# mac os only
WORD_LIST = File.read("/usr/share/dict/words").split("\n")

def fix_hyphens(text)
  text.split(" ").map do |word|
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

Phrase.delete_all  # clear all existing phrases

reader.each_paragraph(1, "vi") do |lines, line_number, page_number|
  cur_paragraph = fix_hyphens(lines.map(&:text).join(" "))
  cur_paragraph.localize.each_sentence do |sentence|
    puts sentence
    cur_phrase = Phrase.create(
      key: sentence,
    )
  end
end
