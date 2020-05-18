class UserRolesController < ApplicationController
	include PermissionsHelper
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def addRole
		debugger
		role = params[:role]
		user = User.find(params[:id])
		change_role(user,role)
	end

	def removeRole
		user = User.find(params[:id])
		delete_role(user)
	end
end
