class UsersController < ApplicationController
	def index
		@user = User.all
	end

	def home
		if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = User.find(current_user.id)
    end
	end
end
