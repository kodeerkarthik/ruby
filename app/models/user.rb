class User < ActiveRecord::Base
  has_many :articles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :signup_confirmation
  def signup_confirmation
    UserMailer.signup_confirmation(self).deliver
  end
end
