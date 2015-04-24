require 'spec_helper'

describe LineItem do
	it "create item " do
		item = LineItem.new
		expect(item).to be_valid
	end

	it "save item" do
		item = LineItem.new
		expect(item.save).to be_truthy
	end

	it "create item with product_id and cart_id" do
		product = Product.new(
   	  	title: 'Asus',
   	  	description: 'This is a good laptop',
   	  	image_url: 'Asus F550DP.jpg',
   	  	price: 200)
   	  	product.save
   	  	cart = Cart.new(id: 1)
   	  	cart.save
   	  	item = LineItem.new(product_id: product.id, cart_id: cart.id)
   	  	expect(item.product_id).to eq product.id
   	  	expect(item.cart_id).to eq cart.id
	end
end