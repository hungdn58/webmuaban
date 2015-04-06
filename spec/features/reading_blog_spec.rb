require 'spec_helper'

feature 'Reading the Blog' do
  background do
    @post = Post.create(:name => 'Awesome Blog Post', :text => 'great!')
    Post.create(:name => 'Another Awesome Post', :text => 'beautyful!')
  end

 scenario 'Reading the blog index' do
    visit root_path

    expect(page).to have_content 'Awesome Blog Post'
    expect(page).to have_content 'Another Awesome Post'
  end
end