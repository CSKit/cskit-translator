class VotesController < ApplicationController

  UPVOTE_VALUE = 1
  DOWNVOTE_VALUE = -1

  before_filter :authenticate_user!
  before_filter :set_passage
  before_filter :set_translation

  def upvote
    render_vote(
      perform_vote(UPVOTE_VALUE)
    )
  end

  def downvote
    render_vote(
      perform_vote(DOWNVOTE_VALUE)
    )
  end

  private

  def render_vote(vote)
    if vote.save
      flash[:notice] = "Vote saved."
      redirect_to phrase_path(@passage)
    else 
      flash[:alert] = "Error - vote not saved."
      redirect_to phrase_path(@passage)
    end
  end

  def perform_vote(options = {})
    vote_for(current_user, @translation).tap do |vote|
      vote.assign_attributes(value: options.fetch(:vote_value, UPVOTE_VALUE))
    end
  end

  def vote_for(user, translation)
    Vote.where(user: user, translation: translation).first_or_initialize
  end

  def set_passage
    @passage = Phrase.find(params[:phrase_id])
  end

  def set_translation
    @translation = Translation.find(params[:translation_id])
  end

end