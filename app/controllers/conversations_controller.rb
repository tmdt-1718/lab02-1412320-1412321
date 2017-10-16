class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.get_all(current_user.id)
  end
end
