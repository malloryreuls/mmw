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

  describe 'POST create' do
    describe 'sucessful create' do
      it "should save a new query to the database" do
        expect{POST :create, :query => "boat"}.to change(Search, :count).by(1)
      end
    end
  end







end