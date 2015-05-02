require 'spec_helper'

describe Cart do
	it "create cart" do
		cart = Cart.new
		expect(cart).should be_valid
	end	

	it "test add product" do
		product = Product.new(
   	  	title: 'Asus',
   	  	description: 'This is a good laptop',
   	  	image_url: 'Asus F550DP.jpg',
   	  	price: 200)
   	  	product.save
   	  	cart = Cart.new
   	  	cart.save
   	  	item = cart.add_product(product.id,product.price)
   	  	item.save
   	  	item.should be_an_instance_of(LineItem)
   	  	item1 = cart.add_product(product.id,product.price)
   	  	item1.quantity.should eq 2
	end

	it "test total price" do
		product = Product.new(
   	  	title: 'Asus',
   	  	description: 'This is a good laptop',
   	  	image_url: 'Asus F550DP.jpg',
   	  	price: 200)
   	  	product.save
   	  	cart = Cart.new
   	  	cart.save
   	  	item = cart.add_product(product.id,product.price)
   	  	item.save
   	  	cart.total_price.should eq 200
	end
end