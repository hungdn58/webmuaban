require 'spec_helper'

feature 'Create and Edit Product' do

	context 'Create new Product' do
		context 'as an user' do
    		background do
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

		    scenario 'Create a product' do
		      	visit products_path
		      	click_link 'New product'

		      	fill_in 'product_title', :with => 'New Product'
		      	fill_in 'product_description', :with => 'This product was made from the Admin Interface'
		      	attach_file 'Choose files here', File.join(Rails.root, 'public', 'uploads', 'tmp', '1422897108-13576-4844', '1.PNG')
		      	click_button 'OK'

		      	expect(page).to have_content 'New Product'
		    end
		 end

	    context 'Edit Product' do
	    	background do
	      		@product = Product.create(:title => 'Awesome Blog Post', :description => 'Lorem ipsum dolor sit amet', :price => '50')
	    	end

	    	scenario 'Editing an existing blog' do
	      		visit product_path(@product)

	      		click_link 'Edit'

	      		fill_in 'Title', :with => 'haha'
	      		click_button 'OK'

	      		expect(page).to have_content 'haha'
	    	end
	  	end
	 end
end
