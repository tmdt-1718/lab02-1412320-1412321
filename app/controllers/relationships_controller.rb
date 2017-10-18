class RelationshipsController < ApplicationController
  before_action :logged_in_user
  #status 1: pending
  #status 2: friend
  #status 3: block
  def create
    friend = User.find(params[:user_two_id])
    current_user.add_friend(friend)
    relationship = Relationship.find_by(user_two_id: params[:user_two_id])
    relationship.status = 1
    relationship.action_user_id = current_user.id
    relationship.save
    redirect_to user_home_path(user_id: friend.id)
  end

  def update
    relationship = Relationship.find(params[:id])
    if relationship.status == 1
      relationship.update(status: 2)
    elsif relationship.status == 2
      relationship.update(status: 3)
    elsif relationship.status == 3
      relationship.update(status: 2)
    else
      relationship.update(status: 1)
    end
    redirect_to user_home_path(user_id: relationship.user_two_id)
  end


  def destroy
    friend = Relationship.find(params[:id]).user_two
    current_user.unfriend(friend)
    redirect_to user_home_path(user_id: friend.id)
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
