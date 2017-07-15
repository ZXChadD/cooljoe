class MessagesController < ApplicationController

  def new; end

  def create
    @message = Message.new(message_params)
    if current_user
      @message.body = current_user.firstname + ' : ' + @message.body
      @message.userticks = 'blue'
    else current_provider
         @message.body = current_provider.firstname + ' : ' + @message.body
         @message.providerticks = 'blue'
    end
    redirect_back(fallback_location: users_path) if @message.save!
  end

  private

  def message_params
    params.require(:message).permit(:provider_id, :user_id, :conversation_id, :body)
  end

end
