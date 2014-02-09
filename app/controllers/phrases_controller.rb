
class PhrasesController < ApplicationController
  def index
    @phrases = Phrase.first(100)
  end

  def show
    @passage = Phrase.find(params[:id])
    @translations = @passage.top_translations
    @passage_with_text = @passage.phrase_context

    @new_translation = Translation.new
    
    preseed_user_id = User.find_by_email('cshackathon@gmail.com').id
    @preseed = Translation.find_by(
      :user_id => preseed_user_id,
      :phrase_id => @passage.id)
        .translation rescue ''
  end

end
