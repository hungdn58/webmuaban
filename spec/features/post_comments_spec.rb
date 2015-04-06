require 'spec_helper'

feature 'Posting Comments' do
  background do
    @post = Post.create(:name => 'Awesome Blog Post', :text => 'Lorem ipsum dolor sit amet')
  end

  # Note this scenario doesn't test the AJAX comment posting.
  scenario 'Posting a comment' do
    visit post_path(@post)

    comment = 'hihi'
	fill_in 'comment_body', :with => comment
	click_button 'Add comment'

    expect(page).to have_content comment
  end
end