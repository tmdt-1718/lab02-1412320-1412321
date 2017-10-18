class MessagesController < ApplicationController
  def create
    @conversation = Conversation.includes(:recipient).find(params[:conversation_id])
    @message = @conversation.messages.create(message_params)

    respond_to do |format|
      format.js
    end
  end

  def index
    conversations = Conversation.get_all(current_user.id)
    @messages = conversations.collect(&:messages).flatten.uniq
    @messages.delete_if { |message| message.user == current_user }
    respond_to do |format|
      format.html
      format.js
    end
  end

  def sent
    @messages = current_user.messages
  end

  private
    def message_params
      params.require(:message).permit(:user_id, :content)
    end
end
