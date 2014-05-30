class SearchesController < ApplicationController
    before_action :freebase_init

  def index
# calls the results method/action in our search model using the freeb param that gets passed
    @freeb = Search.results(params[:freeb])
    image_results=Search.imageview(@freeb.id)
    @images = image_results["property"]["/common/topic/image"]["values"].map { |value| value["id"] }
    @youtube = Search.youtube(params[:freeb])
    
  end

  def new

  end

  def create
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

end
