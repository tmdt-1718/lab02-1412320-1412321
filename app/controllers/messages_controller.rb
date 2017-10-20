class MessagesController < ApplicationController
  def create
    if(params[:conversation_id])
      @conversation = Conversation.includes(:recipient).find(params[:conversation_id])
    else
      @conversation = Conversation.get(current_user.id, params[:message][:user_id])
    end

    @message = @conversation.messages.create(message_params)
    respond_to do |format|
      format.js
    end

  end

  def index
    # For loading messages
    conversations = Conversation.get_all(current_user.id)
    @messages = conversations.collect(&:messages).flatten.uniq
    @messages.delete_if { |message| message.user == current_user }
    
    # For create new message
    @message = Message.new
    @users = User.where.not(id: current_user.id)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def sent
    @messages = current_user.messages
  end

  def show
    begin
      @message = Message.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      head 404
    else
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  private
    def message_params
      params.require(:message).permit(:user_id, :content)
    end
end
