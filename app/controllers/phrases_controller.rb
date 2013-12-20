class PhrasesController < ApplicationController

  def show
    key_number = params[:id].to_i
    @passage = Phrase.find(params[:id])
    if key_number == 1
      @passage_with_text = Phrase.find(key_number + 1)
    else
      @passage_with_text = Phrase.find(key_number - 1, key_number + 1)
    end
    @new_translation = Translation.new
  end
end