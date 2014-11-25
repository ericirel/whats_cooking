class VotesController < ApplicationController
  def create
    @vote = current_user.votes.where(:recipe_id => params[:vote][:recipe_id]).first
    @vote ||= current_user.votes.create(vote_params)
    @vote.update_attributes(:up => params[:vote][:up])
    redirect_to :back
  end

  private

  def vote_params
    params.require(:vote).permit(:up, :recipe_id, :user_id)
  end
end
