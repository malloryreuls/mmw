class Search < ActiveRecord::Base

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


	def self.youtube(query)
		# Grabs the first 5 ids from the results of our youtube search
		youtube_results	=	YoutubeSearch.search(query).map { |value| value["video_id"] }.take(3)
	end

	def self.google_image(query)
		result = GoogleImageApi.find( query, {
	    :imgsz => "medium",
	    :rsz => 8,
	    :start => 1,
	  	})
	  	 result.images.each do |img|
    	puts img['url']

  		end
	end
end
