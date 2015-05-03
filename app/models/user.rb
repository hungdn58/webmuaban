class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :conversations, :foreign_key => :sender_id, dependent: :destroy
  has_many :products, -> {order('title ASC')},
						:dependent => :nullify, :foreign_key => :user_id
  has_many :comments, dependent: :destroy
  has_many :responses, :through => :products, :source => :comments , dependent: :destroy
  after_create :create_default_conversation
  # after_create :send_admin_mail

  def send_admin_mail
    UserMailer.welcome_email(self).deliver
  end
  
  private

  # for demo purposes

  def create_default_conversation
    Conversation.create(sender_id: 1, recipient_id: self.id) unless self.id == 1
  end
end
