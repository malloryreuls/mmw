class DashboardController < ApplicationController
  def index
  	@history_count = num_search_history
    @histories = Search.all
  end

  protected

	def num_search_history
		words = Search.all
		words_array = words.map { |w| w.query.downcase }
		@num_search = Hash.new(0)
		words_array.each { |v| @num_search[v] += 1 }
		@num_search.sort_by{ |k, v| -v}
	end

end