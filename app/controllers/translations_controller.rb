class TranslationsController < ApplicationController
  def create
    binding.pry
    @new_translation = Translation.new trans_params

    if @new_translation.save
      flash[:notice] = "Translation saved!"
      redirect_to root_path
    else 
      flash[:alert] = "Error - translation not saved."
      render 'welcome#index'
    end
  end

  def trans_params
    params.require(:translation).permit!
  end
end