class ManageUserController < ApplicationController
  load_and_authorize_resource :class => ManageUserController

  def index
    @users = User.all
    @articles = Article.all
  end

  def user_roles
    @user = User.find(params[:id])
  end

 
end
