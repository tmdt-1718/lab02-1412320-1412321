class RelationshipsController < ApplicationController
  before_action :logged_in_user
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  #status 1: pending
  #status 2: friend
  #status 3: block
  def create
    relationship = Relationship.between(current_user.id, params[:user_two_id]).first
    unless relationship
      current_user.add_friend(User.find(params[:user_two_id]))
      relationship = Relationship.between(current_user.id, params[:user_two_id]).first
      relationship.status = 1
      relationship.save
    end
    friend = User.find_friend(current_user, relationship)
    redirect_to user_home_path(user_id: friend)
  end

  def update
      @relationship = Relationship.find(params[:id])
      friend = User.find_friend(current_user, @relationship)
      if @relationship.status == 1
        @relationship.update(status: 2)
      elsif @relationship.status == 2
        @relationship.update(status: 3, block_id: current_user.id)
      else
        if current_user.id == @relationship.block_id
          @relationship.update(status: 2, block_id: nil)
        elsif @relationship.block_id == -1
          @relationship.update(status: 3, block_id: friend)
        else
          @relationship.update(status: 3, block_id: -1)
        end
      end
      redirect_to user_home_path(user_id: friend)
  end


  def destroy
    relationship = Relationship.find(params[:id])
    friend = User.find_friend(current_user, relationship)
    current_user.unfriend(User.find(friend))
    redirect_to user_home_path(user_id: friend)
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

  def record_not_found
    render '404'
  end
end
