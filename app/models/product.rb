class Product < ActiveRecord::Base
<<<<<<< HEAD
	validates :title, :description, presence: true
	validates :title, uniqueness: true
	# validates :image_url, uniqueness: true
=======
	validates :title, :description, :image_url, presence: true
	validates :title, uniqueness: true
	# validates :image_url, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\z}i,
		message: 'must be a URL for GIF, JPG or PNG image.'
	}
>>>>>>> 939426a3587b672c8e89e7858ebec8455e2930ef
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :price, :numericality => {:less_than_or_equal_to => 1000}
	def long_title
		"#{title} - #{description}"
	end
	# attr_accessible :image
	has_many :line_items
	belongs_to :user
	has_many :comments
<<<<<<< HEAD
	has_many :photos
	accepts_nested_attributes_for :photos
=======
>>>>>>> 939426a3587b672c8e89e7858ebec8455e2930ef
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
