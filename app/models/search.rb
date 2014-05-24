class Search < ActiveRecord::Base

	has_many :terms

	def self.results(freeb)

	  results = FreebaseAPI::Topic.search(freeb)
	  best_match = results.values.first
	  best_match.sync
	  best_match.description
	end

end

