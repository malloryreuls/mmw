class SearchesController < ApplicationController
    before_action :freebase_init
  def index
# calls the results method/action in our search model using the freeb param that gets passed
    @freeb = Search.results(params[:freeb])
    @imageview=Search.imageview(@freeb)
   
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
    FreebaseAPI.session = FreebaseAPI::Session.new(key: 'AIzaSyAEMMKQwxVCAV8CiCPII_AZwPo7PTwjGGE', env: :stable)
    
    end
end
