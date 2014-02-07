require 'twitter_cldr'
require 'pry-nav'

Phrase.delete_all  # clear all existing phrases

data = File.read("/Users/cdutro/Desktop/sh/chapter1.txt").split(/([\d]+|vii|ix|x)\n/)
sentence_idx = 0

data.each_with_index do |page, page_number|
  page.localize.each_sentence do |sentence|
    puts sentence.to_s

    Phrase.create(
      :key => sentence.to_s,
      :sort_key => sentence_idx
    )

    sentence_idx += 1
  end
end
