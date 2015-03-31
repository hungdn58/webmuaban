class User < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	has_secure_password
<<<<<<< HEAD

	has_many :posts
=======
>>>>>>> 131bf370a275e678ae15650b184fcdf0c7788949
end
