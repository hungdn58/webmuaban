# /spec/features/user_registration_spec.rb
require 'spec_helper';
 
describe 'User registration' do

  let(:user_email) { 'registration_test_user@example.org' }
  before :each do
    visit users_path

    click_link 'Forgot your password?'
    fill_in 'user_email', with: user_email
    click_button'Send me reset password instructions'

  end
 
  it "shows message about confirmation email" do
    expect(page).to have_content("Forgot your password?")
  end
 
  describe "Resetpassword email" do
  	
    # Include email_spec modules here, not in rails_helper because they
    # conflict with the capybara-email#open_email method which lets us
    # call current_email.click_link below.

    include EmailSpec::Helpers
    include EmailSpec::Matchers
 
    # open the most recent email sent to user_email
    subject { open_email(user_email) }
 
    # # Verify email details
    # it { is_expected.to deliver_to(user_email) }
    # it { is_expected.to have_body_text(/Someone has requested a link /) }
    # # it { is_expected.to have_body_text(/users\/confirmation\?confirmation/) }
    # it { is_expected.to have_subject(/Reset password instructions/) }
  end
 
  context "when clicking confirmation link in email" do
    before :each do
      open_email(user_email)
      current_email.click_link 'Confirm my account'
    end
 
    it "shows confirmation message" do
      expect(page).to have_content('Listing posts')
    end
 
    it "confirms user" do
      user = User.find_for_authentication(email: user_email)
      expect(user).to be_confirmed
    end
  end
end