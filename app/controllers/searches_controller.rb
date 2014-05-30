class SearchesController < ApplicationController
    before_action :freebase_init

  def index
# calls the results method/action in our search model using the query param that gets passed
    @query = Search.results(params[:query])
    image_results=Search.imageview(@query.id)
    @images = image_results["property"]["/common/topic/image"]["values"].map { |value| value["id"] }
    @youtube = Search.youtube(params[:query])

  end

  def new
    @query = Search.new
  end

  def create
    @query = Search.new(query_params)
    if @query.save
      redirect_to searches_path
    else
      render 'new'
    end
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
      params.require(:query).permit(:query)
    end
end
