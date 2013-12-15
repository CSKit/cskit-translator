class WelcomeController < ApplicationController
  def index
    key_number = (Phrase.count * rand).to_i
    @passage = Phrase.find(key_number - 1, key_number, key_number + 1)

    @new_translation = Translation.new(phrase: @passage[1])
  end
end
