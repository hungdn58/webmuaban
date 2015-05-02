require 'spec_helper'

feature "Posting Comments" do
  background do
	@product = Product.create(:title => 'Awesome Blog Post', :description => 'Lorem ipsum dolor sit amet', :price => '50', :user_id => 1)
	email = 'admin@example.com'
    password = 'password'
    log_in_admin_user
  end

  def log_in_admin_user(email = 'admin@example.com', password = 'password')
	reset_session!
	visit users_path
	fill_in 'Email', :with => email
	fill_in 'Password', :with => password
	click_button 'Log in'
  end

  scenario "Posting a comment on product" do
  	visit product_path(@product)

  	comment = "hihihi"

  	fill_in 'comment_body', :with => comment
    click_button 'Add comment'

  	expect(page).to have_content comment
  end
end