class CombineItemsInCart < ActiveRecord::Migration
  def self.up
  	#replace multiple items for a single product in a cart with a single item
  	Cart.all.each do |cart|
  		sums = cart.line_items.group(:product_id).sum(:quantity)
  		sums.each do |product_id,quantity|
  			if quantity > 1
  				#delete inviditual items
  				cart.line_items.where(:product_id=>product_id).delete_all
  				#replace with a single item
  				cart.line_items.create(:product_id=>product_id , :quantity=>quantity)
  			end
  		end
  	end
end

	def self.down
		#split item with quantity > 1 into mutiple items
		LineItem.where("quantity > 1").each do |line_item|
			#add inviditual item
			line_item.quantity.times do
				LineItem.create :cart_id=>line_item.cart_id, :product_id=>line_item.product_id, :quantity=>1
			end
			#remove original item
			line_item.destroy
		end
	end
end
