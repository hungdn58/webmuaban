class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :photos
	validates_presence_of :name, :text
	accepts_nested_attributes_for :photos
end
