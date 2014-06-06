require 'spec_helper'

describe SearchesController do



  describe 'GET index' do
    # let(:valid_attributes){{:query => "boat"}}
    it "should show all the results for a given @query" do
      query = Search.results("boat")
      get :index
      expect(query.name).to eq("Boat")
    end
  end
end