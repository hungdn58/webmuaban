class User < ActiveRecord::Base
	has_many :posts
	has_many :replies, :through => :posts, :source => :comments
	validates :name, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	has_secure_password
end
