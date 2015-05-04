require 'spec_helper'

describe Photo do
	it "create photo" do 
		@photo = Photo.new(image_uid: "Test")
		@photo.save
		@photo.image = File.new('app/assets/images/test.jpg')
		expect(@photo.image.size).should eq 605915
		expect(@photo.image).should_not be_nil
	end

	it "create photo with post" do
		photo = Photo.new(image_uid: "Test")
		photo.save
		post = Post.new(
			photos: [photo],
   			title: 'Laptop',
   			body: 'Asus')
		post.save
		post.photos.should include (photo)
	end

	it "create photo with product" do
		photo = Photo.new(image_uid: "Test")
		photo.save
		product = Product.new(
		photos: [photo],
   		title: 'Asus',
   		description: 'This is a good laptop',
   		image_url: 'Asus F550DP.jpg',
   		price: 200)
		product.save
		product.photos.should include (photo)
	end
end
