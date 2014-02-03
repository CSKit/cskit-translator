require 'google_fish'
class PhrasesController < ApplicationController
  def index
    redirect_to phrase_path((Phrase.count * rand).to_i)
  end

  def show
    @passage = Phrase.find(params[:id])
    @translations = @passage.translations.reverse_order.limit(10).includes(:user)
    @passage_with_text = surrounding_text(@passage)
    @new_translation = Translation.new
    
    google = GoogleFish.new('AIzaSyByAx33iCWb9hYGtxa3eLNkeaQZInrwzx8')
    @preseed = google.translate(:en, :zh, @passage.key)

  end
end
