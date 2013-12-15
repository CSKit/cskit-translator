class TranslationsController < ApplicationController
  def create
    binding.pry
    @new_translation = Translation.new(params.require(:translation).permit!)

    if @new_translation.save
      flash[:notice] = "Translation saved!"
      redirect_to root_path
    else 
      flash[:alert] = "Error - translation not saved."
      render 'welcome#index'
    end
  end
end