require 'spec_helper'

feature 'Managing blog posts' do

  scenario 'Posting a new blog' do
    visit root_path

    click_link 'New Post'

    # expect(page).to have_content 'New post'

    fill_in 'Title', :with => 'I love cheese'
    fill_in 'Body', :with => "It's pretty amazing, don't you think?"

    click_button 'Create Post'
    expect(page).to have_content 'I love cheese'
  end

  context 'with an existing blog post' do
    background do
      @post = Post.create(:title => 'Awesome Blog Post', :body => 'Lorem ipsum dolor sit amet')
    end

    scenario 'Editing an existing blog' do
      visit post_path(@post)

      click_link 'Edit'

      fill_in 'Title', :with => 'Not really Awesome Blog Post'
      click_button 'Update Post'

      expect(page).to have_content 'Not really Awesome Blog Post'
    end
  end

  context 'as an admin user' do
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

    scenario 'Posting a new blog' do
      visit posts_path
      click_link 'New Post'

      fill_in 'post_title', :with => 'New Blog Post'
      fill_in 'post_body', :with => 'This post was made from the Admin Interface'
      click_button 'Create Post'

      expect(page).to have_content 'This post was made from the Admin Interface'
    end

    context 'with an existing blog post' do
      background do
        @post = Post.create(:title => 'Awesome Blog Post', :body => 'Lorem ipsum dolor sit amet')
      end

      scenario 'Editing an existing blog' do
        visit post_path(@post)

        click_link 'Edit'

        fill_in 'Title', :with => 'Not really Awesome Blog Post'
        click_button 'Update Post'

        expect(page).to have_content 'Not really Awesome Blog Post'
      end
    end
   end


end