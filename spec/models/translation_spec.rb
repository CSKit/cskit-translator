require 'spec_helper'

describe "Translation" do
  
  describe ".best_translations" do
    it "returns all of the best translations" do
      some_phrase = Phrase.create!(key: "It's probably time to go to bed.", page: '24')
      best = some_phrase.translations.create!(translation: "Shhh...", user_id: 1)
      best.votes.create!(value: 5)
      another = some_phrase.translations.create!(translation: "Bedtime schmedtime", user_id: 2)

      expect(Translation.best_translations).to eq([best])
    end
  end
end