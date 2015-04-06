class UserMailer < ApplicationMailer
	default from: "from@example.com"
	def welcome_email(user)
		@user = user
		@url = 'http://google.com'
		mail(to: @user.email, subject: 'Welcome email')
	end
end
