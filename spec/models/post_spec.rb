require 'spec_helper'

describe Post do
   it "is valid with a title, body and image url" do
   	post = Post.new(
   	title: 'Laptop',
   	body: 'Asus')
   	expect(post).to be_valid
   end

   it "is invalid without a title" do
   	post = Post.new(title: nil)
   	post.valid?
   	expect(post.errors[:title]).to include("can't be blank")
   end

   it "is invalid without a body" do 
   	post = Post.new(body: nil)
      post.valid?
      expect(post.errors[:body]).to include("can't be blank")
   end
end
