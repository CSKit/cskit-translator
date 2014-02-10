require 'spec_helper'

describe "Phrase" do 

  before :each do
    @first_phrase = Phrase.create!(key: "Hey there, sassy pants.", sort_key: 1)
    @second_phrase = Phrase.create!(key: "I'm a very eloquent phrase", sort_key: 2)
    @third_phrase = Phrase.create!(key: "You wish you were...", sort_key: 3)

    @best_translation = @first_phrase.translations.create!(translation: "I'm #1! I'm #1!")
    @best_translation.votes.create!(value: 1)
    @another_translation = @first_phrase.translations.create!(translation: "I am sub-par")
  end

  describe ".rand_phrase" do
    it "returns one random phrase" do
      expect([@first_phrase, @second_phrase, @third_phrase]).to include(Phrase.rand_phrase)
    end
  end

  describe ".phrase_context" do
    it "returns phrase and the sentences before/after it" do
      expect(@second_phrase.phrase_context).to eq([@first_phrase,@third_phrase])
    end

    it "returns a blank value in first index if first phrase" do
      expect(@first_phrase.phrase_context).to eq(['',@second_phrase])
    end

    it "returns a blank value in the second index if last phrase" do
      expect(@third_phrase.phrase_context).to eq([@second_phrase,''])
    end
  end

  describe ".best_translation" do
    it "returns the highest voted translation for a phrase with many translations" do
      expect(@first_phrase.best_translation).to eq(@best_translation)
    end

    it "returns a string if there are no translations yet" do
      expect(@second_phrase.best_translation).to eq('No translations yet')
    end
  end
  
end