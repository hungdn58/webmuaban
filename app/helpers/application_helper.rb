module ApplicationHelper
	def gravatar_for(user, size = 30)
  		image_tag gravatar_image_url(user.email, size: size), title: user.name, class: 'img-rounded'
	end
end
