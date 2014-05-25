class Search < ActiveRecord::Base

	has_many :terms


	def self.results(freeb)
		freeb ||= "matrix"
	  results = FreebaseAPI::Topic.search(freeb)
	 	best_match = results.values.first
	  	best_match.sync
	  	best_match
	  # best_match.description 
	  # raise results.inspect
	  # best_match.image
	
	end

	def self.imageview(imageview)
		
		results = FreebaseAPI.session.topic(imageview.id, filter: '/common/topic/image/')


	end
end
