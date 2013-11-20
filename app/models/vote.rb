class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :scrap

  attr_accessible :vote_number, :scrap

  validates :vote
end
