class ManageUsersController < ApplicationController
  # load_and_authorize_resource :class => ManageUsersController
  include ManageUsersHelper
  def index
    @users = User.all
    @articles = Article.all
  end
   
  def show
		@user = User.find(params[:id])
  end
  
  def addRole
		role = params[:role]
		user = User.find(params[:id])
		change_role(user,role)
	end

	def removeRole
		user = User.find(params[:id])
		delete_role(user)
  end
  
end
