module ApplicationHelper
	def gravatar_for(user, size = 30, title = user.name)
  		image_tag gravatar_image_url(user.email, size: size), title: title, class: 'img-rounded'
	end
	def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end
end
