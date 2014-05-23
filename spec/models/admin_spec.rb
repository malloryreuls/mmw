require 'spec_helper'

describe Admin do 

	before(:all) do
		@admin = Admin.new
	end

	it "should have an admin email" do
		admin.email.should_not be_nil
	end

	it "should have an admin password" do
		admin.password_digest.should_not be_nil
	end

end