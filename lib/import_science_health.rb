require 'cskit'
require 'cskit/science_health'

include CSKit::Readers

SENTENCE_TERMINATOR_REGEX = /(\.\"|[\?\.])/
COMBINERS = [
  lambda { |phrase| phrase == "." }
]

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
sentence = ""
sentence_index = 0
cur_phrase = nil

Phrase.delete_all  # clear all existing phrases

reader.each_line(1, "vi") do |line, line_number, page_number|
  sentence += line.text
  sentence += " " unless sentence =~ /.*\-\z/

  if match = sentence.match(SENTENCE_TERMINATOR_REGEX)
    sentence_end = match.offset(0).first + match.captures.first.size
    found = sentence[0..sentence_end].strip
    found = " #{found}" if [0..1] == "- "  # add extra space if fragment begins with hyphen space
    found = fix_hyphens(found)

    # combine certain non-sentence fragments, i.e. ellipses
    if COMBINERS.any? { |combiner| combiner.call(found) }
      cur_phrase.update_attributes(key: "#{cur_phrase.key}#{found}")
    elsif cur_phrase && cur_phrase.key[-3..-1] == "..."
      cur_phrase.update_attributes(key: "#{cur_phrase.key}#{found}")
    else
      cur_phrase = Phrase.create(
        key: found,
        sort_key: sentence_index
      )
    end

    puts found

    sentence_index += 1
    sentence = sentence[sentence_end + 1..-1] || ""
  end
end