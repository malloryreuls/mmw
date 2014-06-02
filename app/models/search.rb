class Search < ActiveRecord::Base

	has_many :terms
	validates_presence_of :query, message: "Must enter a search query"

	def self.results(query)
		query ||= "DMX"
		results = FreebaseAPI::Topic.search(query)

		if results == {}
			self.results("DMX")

		else
			best_match = results.values.first
			best_match.sync
			best_match
		end

	end

	def self.imageview(imageview_id)
		# with the @query id, we filter down the object to the common/topic/image section
		results = FreebaseAPI.session.topic(imageview_id, filter: '/common/topic/image')

	end

	def self.youtube(query)
		# Grabs the first 5 ids from the results of our youtube search
		YoutubeSearch.search(query).map { |value| value["video_id"] }.take(5)
	end
end
