class UsersController < ApplicationController
	def index
		@user = User.all
	end

	def home
		if params[:user_id]
      @user = User.find(params[:user_id])
			user_id = params[:user_id]
			@relationship = Relationship.between(user_id, current_user.id).first
    else
      @user = current_user
			user_id = current_user.id
			@relationship = Relationship.where("user_one_id = ? or user_two_id = ?", user_id, user_id).first
    end

		@relationships = Relationship.where("user_one_id = ? or user_two_id = ?", user_id, user_id)
		@friends = Relationship.includes(:user_one).where("user_one_id = ? or user_two_id = ?", user_id, user_id)
		if f = User.find_friend(@user, @relationship)
			@friend = User.find(f)
		end
	end

private
	def logged_in_user
		unless logged_in?
			redirect_to login_url
		end
	end
end
