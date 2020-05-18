class User < ActiveRecord::Base
  rolify
  mount_uploader :avatar, AvatarUploader
  has_many :articles
  has_many :posts
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  after_create :signup_confirmation
  def signup_confirmation
    UserMailer.signup_confirmation(self).deliver
  end

  def username
    return self.email.split('@')[0].capitalize
  end

	def admin
		return self.has_role? :admin
  end
  def moderator
		return self.has_role? :moderator
  end
  def manager
		return self.has_role? :manager
	end
end
