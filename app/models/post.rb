class Post < ActiveRecord::Base
	validates_presence_of :body, :title
	belongs_to :user
	has_many :comments, :as => :commentable
end
