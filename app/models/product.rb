class Product < ActiveRecord::Base
	validates :title, :description, presence: true
	validates :title, uniqueness: true
	# validates :image_url, uniqueness: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :price, :numericality => {:less_than_or_equal_to => 1000}
	def long_title
		"#{title} - #{description}"
	end
	# attr_accessible :image
	has_many :line_items
	belongs_to :user
	has_many :comments
	has_many :photos
	accepts_nested_attributes_for :photos
	before_destroy :ensure_not_referenced_by_any_line_item
	private
		def ensure_not_referenced_by_any_line_item	
			if line_items.empty?
				return true
			else
				errors.add(:base, 'Line Items present')
				return false
			end
		end
end
