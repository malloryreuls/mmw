require 'spec_helper'

describe AdminsController do

	let(:valid_attributes) {{ :email => "test@test.com", 
		:password_digest => "12345"}}

	describe "GET 'index'" do
		it "returns http success" do
			get 'index'
			response.should be_success
		end

		it "should render out the index template" do
			get 'index'
			expect(response).to render_template :index
		end
	end

	describe "GET new" do
		before {get :new}
		it "returns http success" do
			get 'new'
			response.should be_success
		end

		it "should render the new template" do
			expect(response).to render_template :new
		end

		it "should succeed" do
			expect(response).to be_success
		end

		it "should assign a new admin" do
			expect(assigns(:admin)).to be_a(Admin)
			expect(assigns(:admin)).to_not be_persisted
		end
	end

	describe "POST create" do
		describe "successful create" do
			it "should save a new admin to the database" do
				expect {post :create, admin: valid_attributes}.to change(Admin, :count).by(1)
			end

			it "should redirect to the index action" do
		        post :create, admin: valid_attributes
		        expect(response).to redirect_to admins_path
		    end
		end

		describe "not able to save" do
		 	let(:invalid_attributes) {{
		 	:email => nil }}

		 it "should not save new admin to database" do
		 	expect {post :create, admin: invalid_attributes}.to_not change(Admin, :count).by(1)
		 end
		end
	end

	describe "GET show" do
			it "should have 200 status code" do
			admin2 = Admin.create!(email: "boo@boo.com", password_digest: "12345")
			get :show, id: admin2.id
			expect(response.status).to eq(200)
			expect(assigns(:admin)).to eq(admin2)
		end
	end
end