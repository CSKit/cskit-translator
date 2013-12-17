class PhrasesController < ApplicationController

  def show
    key_number = params[:id].to_i
    @passage = Phrase.find(params[:id])
    @passage_with_text = Phrase.find(key_number - 1, key_number, key_number + 1)
    @new_translation = Translation.new
  end
end