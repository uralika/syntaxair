class Scrap < ActiveRecord::Base
  belongs_to :user
  has_many :votes, dependent: :destroy


  
  default_scope order('rank DESC')


	validates :search_tag, presence: true
	validates :body, presence: true

	def self.search(search)
		search_condition = "%" + search + "%"
		where('search_tag LIKE ? OR body LIKE ?', search_condition, search_condition)
	end

	 def scrapdef
	 	@search_tag = search_tag
		@body = body
		# "Searched by #{@search_tag}, here: #{@body}"
	end

	def up_votes
		self.votes.where(vote_number: 1).count
	end

	def down_votes
		self.votes.where(vote_number: -1).count
	end

	def points
		self.votes.sum(:vote_number).to_i
	end

	def update_rank
		age = (self.created_at - Time.new(1970,1,1)) / 86400
		new_rank = points*age + age

		self.update_attribute(:rank, new_rank)
	end

end
