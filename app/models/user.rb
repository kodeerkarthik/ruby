class User < ActiveRecord::Base
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
end
