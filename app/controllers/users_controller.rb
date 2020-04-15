class UsersController < ApplicationController
    def create
        user= User.new(user_params)
        if user.save
            # session[:user_id]= user_id
            redirect_to '/'
        else 
            flash[:register_errors]=user.errors.full_messages
            redirect_to '/'
        end
    end

    private
        def user_params
            params.require(:user).permit(:name,:email,:password,:password_confirmation)
        end

end
