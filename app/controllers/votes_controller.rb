class VotesController < ApplicationController
	def up_vote
		@scrap = Scrap.find(params[:scrap_id])
		@vote = @scrap.votes.where(user_id: current_user.id).first

		if @vote
			@vote.update_attribute(:vote_number, 1)
		else
			@vote = current_user.votes.create(value: 1, scrap: @scrap)