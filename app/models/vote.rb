class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :scrap

  # attr_accessible :vote_number, :scrap

  validates :vote_number, inclusion: { in: [-1, 1], message: "%{vote_number} is not a valid vote."}

  after_save :update_scrap

  private

  def update_scrap
  	self.scrap.update_rank
  end
  
end
