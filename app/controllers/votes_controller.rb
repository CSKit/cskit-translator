class VotesController < ApplicationController
  before_filter :authenticate_user!

  def upvote
    @passage = Phrase.find(params[:phrase_id])
    @translation = Translation.find(params[:translation_id])

    if Vote.create(user: current_user, translation: @translation, value: 1)
      flash[:notice] = "Vote saved."
      redirect_to phrase_path(@passage)
    else 
      flash[:alert] = "Error - vote not saved."
      redirect_to phrase_path(@passage)
    end
  end

  def downvote
    @passage = Phrase.find(params[:phrase_id])
    @translation = Translation.find(params[:translation_id])

    if Vote.create(user: current_user, translation: @translation, value: -1)
      flash[:notice] = "Vote saved."
      redirect_to phrase_path(@passage)
    else 
      flash[:alert] = "Error - vote not saved."
      redirect_to phrase_path(@passage)
    end
  end


end