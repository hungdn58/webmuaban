class Product < ActiveRecord::Base
	validates :title, :description, :image_url, presence: true
	validates :title, uniqueness: true
	# validates :image_url, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\z}i,
		message: 'must be a URL for GIF, JPG or PNG image.'
	}
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :price, :numericality => {:less_than_or_equal_to => 1000}
	def long_title
		"#{title} - #{description}"
	end
	# attr_accessible :image
  	has_attached_file :image, :styles => { :medium => "620x620>", :thumb => "200x200>" }
  	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	has_many :line_items
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
