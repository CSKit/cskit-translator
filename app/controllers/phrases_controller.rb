class PhrasesController < ApplicationController
  def index
    @phrases = Phrase.all
    @translations = Translation.robot_translations_hash(@phrases.pluck(:id))
    @translations = Phrase.best_translations_for(@phrases.map(&:id)).each_with_object({}) do |trans, ret|
      ret[trans.phrase_id] = TranslatedPhrase.new(trans.translation, trans.locale)
    end

    Phrase.find(Phrase.pluck(:id) - @translations.keys).each_with_object(@translations) do |phrase, ret|
      ret[phrase.id] = phrase.translations.first
    end
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

TranslatedPhrase = Struct.new(:translation, :locale, :auto?)
