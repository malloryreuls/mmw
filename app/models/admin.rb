class Admin < ActiveRecord::Base
	validates_presence_of :email, message: "Cannot have an admin account without email"
	validates_presence_of :password_digest, message: "Cannot have an admin account without a password"
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
