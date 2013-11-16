class Scrap < ActiveRecord::Base
  belongs_to :user

	validates :search_tag, presence: true
	validates :body, presence: true

	def scrapdef
		@search_tag = search_tag
		@body = body
		# "Searched by #{@search_tag}, here: #{@body}"
	end

end
