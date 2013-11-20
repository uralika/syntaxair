class Scrap < ActiveRecord::Base
  belongs_to :user
  has_many :votes, dependent: :destroy

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

end
