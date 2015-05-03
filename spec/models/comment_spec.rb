require  'spec_helper'

describe Comment do
	it "create comment" do
		product = Product.new(
   	  	title: 'Asus',
   	  	description: 'This is a good laptop',
   	  	image_url: 'Asus F550DP.jpg',
   	  	price: 200)
		comment = Comment.new(product.id, "I want to buy it")
		comment.should be_valid
		expect(comment.id).should eq product.id
	end

	it "add id to comment" do
		product = Product.new(
   	  	title: 'Asus',
   	  	description: 'This is a good laptop',
   	  	image_url: 'Asus F550DP.jpg',
   	  	price: 200)
   	  	user = User.new(name: "Ngoc Hung", email: "trhung1710@gmail.com", password: "12345678")
   	  	comment = Comment.new(username: user.name, user_id: user.id, product_id: product.id, body: "hello")
		expect(comment.user_id).should eq user.id
		expect(comment.username).should eq user.name
	end


	it "create comment by user" do
		@user = User.new(name: "Ngoc Hung", email: "trhung1710@gmail.com", password: "12345678")
		@user.save
		@comment = @user.comments.create(body: "hello")
		@comment.should be_an_instance_of(Comment)
	end

	it "add comment to post" do 
		@post = Post.new(
	   		title: 'Laptop',
   			body: 'Asus')
		@post.save
		@comment = @post.comments.create(body: "Hello")
		@comment.should be_an_instance_of(Comment)
		@comment.id.should eq @post.id
	end
end