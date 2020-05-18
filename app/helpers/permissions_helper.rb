module PermissionsHelper
	def change_role(user,role)
		if user.roles.first.present?
			user.roles.first.destroy
			user.add_role role
			user.save
		else
			user.add_role role
			user.save
		end
	end

	def delete_role(user)
		user.roles.first.destroy
	end
end