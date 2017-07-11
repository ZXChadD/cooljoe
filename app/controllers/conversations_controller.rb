class ConversationsController < ApplicationController

  def index
    @conversations = Conversation.all
  end

  def new
    @conversation = Conversation.new
    @providers = Provider.all
  end

  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.user = current_user
    if @conversation.save
      redirect_to conversations_path(current_user.id)
    else
      redirect_to conversations_path(current_user.id)
      flash[:error] = "Conversation already exists"
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:provider_id)
  end

end
