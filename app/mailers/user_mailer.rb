class UserMailer < ApplicationMailer
	default from: "tattantat7@gmail.com"
	def welcome_email(user)
		@user = user
		@url = 'http://google.com'
		mail(to: user.email, subject: 'Welcome email')
	end
end