class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    user = User.find(params[:user_two_id])
    current_user.add_friend(user)
    redirect_to user_home_path(user_id: user.id)
  end

  def destroy
    user = Relationship.find(params[:id]).user_two
    current_user.unfriend(user)
    redirect_to user_home_path(user_id: user.id)
  end

  private
  def logged_in?
    !current_user.nil?
  end

  def logged_in_user
  	unless logged_in?
  		redirect_to login_url
  	end
  end
end
