class VotesController < ApplicationController
	before_filter :setup


	def setup
		@scrap = Scrap.find(params[:scrap_id])
		@vote = @scrap.votes.where(user_id: current_user.id).first
	end

	def update_vote(new_value)
		if @vote
			@vote.update_attribute(:vote_number, new_value)
		else
			@vote = current_user.votes.create(vote_number: new_value, scrap: @scrap)
		end
	end


	def up_vote
		update_vote(1)
		redirect_to :back
	end

	def down_vote
		update_vote(-1)
		redirect_to :back
	end
end