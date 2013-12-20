class PhrasesController < ApplicationController

  def show
    key_number = params[:id].to_i
    @passage = Phrase.find(params[:id])
    surrounding_text(@passage)
    
    @new_translation = Translation.new
  end
end