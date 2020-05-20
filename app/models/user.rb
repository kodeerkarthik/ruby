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

  def active_for_authentication?
    super && !deactivated
  end
  
  def activate_account!   
    update_attributes(deactivated: false)
  end
  
  def deactivate_account!
    update_attributes(deactivated: true) unless deactivated
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
