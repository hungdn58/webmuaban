require 'spec_helper'

feature "Posting Comments" do
  background do
	@post = Post.create(:title => 'Awesome Blog Post', :body => 'Lorem ipsum dolor sit amet', :user_id => 1)
  end

  scenario "Posting a comment" do
  	visit post_path(@post)

  	comment = "hahaha"

  	fill_in 'comment_body', :with => comment
    click_button 'Add comment'

  	expect(page).to have_content 'Signin'
  end
end