class SearchesController < ApplicationController
    before_action :freebase_init

  def index
    # Grabs the last "query" key from the Freebase object array of Search.last
    @last_search = Search.last["query"]
    # Runs the results method on the @last_search query
    @query = Search.results(@last_search)

    # Allows us to render the new search form on Search index
    @search = Search.new

    # Calls the imageview method on the users search(@query) with the freebase id
    image_results=Search.imageview(@query.id)

    # Creates an array of all the image ids associated with that Object that was searched
    @images = image_results["property"]["/common/topic/image"]["values"].map { |value| value["id"] }

    # calls the youtube function on the search query
    @youtube = Search.youtube(@last_search)

  end

  def new
    @search = Search.new
  end

  def create
    # Creates a new search with the field query in our database
    @search = Search.new(query_params)
      @search.save
      redirect_to searches_path

  end

  def update
  end

  def show

  end

    private
    # starts a new freebase session with our API key
    def freebase_init
    FreebaseAPI.session = FreebaseAPI::Session.new(key: ENV['FREEBASE_API'], env: :stable)
    end

    def query_params
      params.require(:search).permit(:query)
    end
end
