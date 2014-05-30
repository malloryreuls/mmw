class Search < ActiveRecord::Base

	has_many :terms
	validates_presence_of :query, message: "Must enter a search query"

	def self.results(query)
		query ||= "matrix"
	  results = FreebaseAPI::Topic.search(query)
	 	best_match = results.values.first
	  	best_match.sync
	  	best_match
	  # best_match.description
	  # raise results.inspect
	  # best_match.image

	end

	def self.imageview(imageview_id)

	results = FreebaseAPI.session.topic(imageview_id, filter: '/common/topic/image')

	end

	def self.youtube(query)
		YoutubeSearch.search(query).map { |value| value["video_id"] }.take(5)
	end
end
