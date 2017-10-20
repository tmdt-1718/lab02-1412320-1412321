class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.get_all(current_user.id)
  end

  def show
    @conversation = Conversation.find(params[:id])

    respond_to do |format|
      format.js
    end
  end
end
