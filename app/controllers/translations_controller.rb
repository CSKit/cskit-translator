class TranslationsController < ApplicationController
  def create
    binding.pry
    @phrase = Phrase.find(params[:phrase_id])
    @new_translation = @phrase.translations.build(trans_params)

    if @new_translation.save
      flash[:notice] = "Translation saved!"
      redirect_to phrase_path(@phrase)
    else 
      flash[:alert] = "Error - translation not saved."
      render 'phrases#show'
    end
  end

  def trans_params
    params.require(:translation).permit!
  end
end