class SearchCountsController < ApplicationController
	respond_to :json
  def index
  	@search_counts = SearchCount.find_by_sql('Select query, count(*), max(created_at) as most_recent  FROM searches GROUP BY query ORDER BY count(*) desc LIMIT 25 ;')
  	respond_with @search_counts
  end
end
