class TranslationsController < ApplicationController
  def create

    @passage = Phrase.find(params[:phrase_id])
    @new_translation = @passage.translations.build(trans_params)

    if @new_translation.save
      flash[:notice] = "Translation saved!"
      redirect_to phrase_path(@passage)
    else 
      flash[:alert] = "Error - translation not saved."
      surrounding_text(@passage)
      render 'phrases/show'
    end
  end

  def trans_params
    params.require(:translation).permit(:translation)
  end
end