class User < ApplicationRecord
	attr_accessor :name, :password, :password_confirmation
	validates :name, presence: true, uniqueness: true
	has_secure_password
end
