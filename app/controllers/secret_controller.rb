class SecretController < ApplicationController
http_basic_authenticate_with :email=> "test@test.com", :password => "1234"

  def index
  end
end
