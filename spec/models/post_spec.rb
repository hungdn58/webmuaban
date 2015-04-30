require 'spec_helper'

describe Post do
  it "is valid with a title, description and image_url" do
   	post = Post.new(
   	title: 'Asus',
   	description: 'This is a good laptop',
   	image_url: 'Asus F550DP.jpg')
   	expect(post).to be_valid
   end 
end
