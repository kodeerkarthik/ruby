class UserMailer < ApplicationMailer


  def signup_confirmation(user)
    @user = user
    @url  = 'http://localhost:3000/'
    mail to: @user.email, subject: "Sign Up confirmation"
  end
end
