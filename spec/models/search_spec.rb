 require 'spec_helper'

 describe Search, :type => :model do 
 	before {@search = Search.create!(query: "DMX")}
 	subject {@search}

 	it { should validate_presence_of(:query).with_message("Must enter a search query")}
 	
 end