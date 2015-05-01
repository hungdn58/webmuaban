class Post < ActiveRecord::Base
	validates_presence_of :body, :title
	belongs_to :user
	has_many :comments, :as => :commentable
	has_many :photos
	accepts_nested_attributes_for :photos
end
