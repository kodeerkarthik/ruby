class PermissionsController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@role = role_params
		@user.roles.first.destroy
		@user.add_role @role.values.first
		redirect_to permission_path(@user)
	end
	
	private
    def role_params
      params.require(:permission).permit(:role)
    end
end
