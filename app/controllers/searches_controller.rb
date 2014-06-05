require 'google_image_api'
class SearchesController < ApplicationController
  before_action :freebase_init
  before_action :set_query, only: [:show]
  respond_to :json, :html

  def index
    @histories = Search.all
    respond_with @histories
  end

  def new
    @search = Search.new
  end

  def create
    # Creates a new search with the field query in our database
    @search = Search.new(query_params)
    if @search.save
      respond_to do |format|
        format.html {redirect_to @search}
        format.json {render json: @search, status: :created}
      end
    else
      respond_to do |format|
        format.html {render 'new'}
        format.json {render json: @search.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
  end

  def show
    respond_to do |format|

      format.html do
        # Grabs the last "query" key from the Freebase object array of Search.last
        @last_search = Search.last["query"]
        # Runs the results method on the @last_search query
        @query = Search.results(@last_search)
        
        # Allows us to render the new search form on Search index
        @search = Search.new
        # Calls the imageview method on the users search(@query) with the freebase id
        image_results = Search.imageview(@query.id)
        if image_results["property"] == nil
          @images = nil
        else
          # Creates an array of all the image ids associated with that Object that was searched
          @images = image_results["property"]["/common/topic/image"]["values"].map { |value| value["id"] }
        end
        # calls the youtube function on the search query
        @youtube = Search.youtube(@last_search)
         @googleimage= Search.google_image(@last_search)

      end

      format.json do
        respond_with @search
      end
    end
  end

  private
    # starts a new freebase session with our API key
    def freebase_init
      FreebaseAPI.session = FreebaseAPI::Session.new(key: ENV['FREEBASE_API'], env: :stable)
    end

    def set_query
      @search = Search.find(params[:id])
    end

    def query_params
      params.require(:search).permit(:query)
    end

    def num_search_history
      words = Search.all
      # raise words.first.query.inspect
      words_array = words.map { |w| w.query.downcase } 
      @num_search = Hash.new(0)
      words_array.each { |v| @num_search[v] += 1 }
      @num_search
    end

  end
