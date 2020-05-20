class ManageUsersController < ApplicationController
  # load_and_authorize_resource :class => ManageUserController

  def index
    @users = User.all
    @articles = Article.all
  end

  def activate   
    user = User.find(params[:user_id])
    if current_user.admin?
      user.activate_account!
      redirect_to manage_user_index_path
    end
  end
  
  def deactivate
    user = User.find(params[:user_id])
    if current_user.admin?
      user.deactivate_account!
      redirect_to manage_user_index_path
    end
  end
end
