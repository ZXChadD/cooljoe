class MessagesController < ApplicationController

  def new
    @message = Message.new
    @conversation = Conversation.find(params[:id])
  end

  def create
    @message = Message.new(message_params)
    if current_user
      @message.body = current_user.firstname + ' : ' + @message.body
      @message.userticks = 'blue'
    else current_provider
       @message.body = current_provider.firstname + ' : ' + @message.body
       @message.providerticks = 'blue'
    end
    respond_to do |format|
      if @message.save!
        format.js
      end
    end
    @conversation = Conversation.find(@message.conversation_id)
    if @conversation.messages.present? && current_user
      @messages = @conversation.messages.update(userticks: 'blue')
    else @conversation.messages.present? && current_provider
      @messages = @conversation.messages.update(providerticks: 'blue')
    end
  end

  private

  def message_params
    params.require(:message).permit(:provider_id, :user_id, :conversation_id, :body)
  end

end
