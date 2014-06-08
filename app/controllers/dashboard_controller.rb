class DashboardController < ApplicationController
  def index
  	@history_count = num_search_history
    @search_counts = SearchCount.find_by_sql('Select query, count(*), max(created_at) as most_recent  FROM searches GROUP BY query ORDER BY count(*) desc LIMIT 25 ;')
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