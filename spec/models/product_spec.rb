require 'spec_helper'

describe Product do
	it "is valid with a title, description, image_url and price" do
		product = Product.new(
			title: "Laptop Asus",
			description: "It is a good laptop",
			image_url: "Asus F550DP.jpg",
			price: 200)
		expect(product).to be_valid
	end

    it "is invalid without a title" do
    	product = Product.new(title: nil)
    	product.valid?
    	expect(product.errors[:title]).to include("can't be blank")
    end

    it "is invalid without a description" do
    	product = Product.new(description: nil)
    	product.valid?
    	expect(product.errors[:description]).to include("can't be blank")
    end

    it "is invalid without an image_url" do
    	product = Product.new(image_url: nil)
    	product.valid?
    	expect(product.errors[:image_url]).to include("can't be blank")
    end

    it "is invalid without a price" do
    	product = Product.new(price: nil)
    	product.valid?
    	expect(product.errors[:price]).to include("is not a number")
    end

    it "is invalid with price is greater than 1000" do 
    	product = Product.new(price: 1001)
    	product.valid?
    	expect(product.errors[:price]).to include("must be less than or equal to 1000")
    end

    it "is invalid with price is less than 0.01" do 
    	product = Product.new(price: 0.0099)
    	product.valid?
    	expect(product.errors[:price]).to include("must be greater than or equal to 0.01")
    end

end