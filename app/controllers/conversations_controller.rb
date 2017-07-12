class ConversationsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  before_action :authenticate_provider!, only: [:allmessages, :showmessages]


  def index
    @conversations = Conversation.where(user_id: current_user.id)
    @conversation = Conversation.new
    @providers = Provider.all
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new(conversation_id: @conversation)
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

  def allmessages
    @conversations = Conversation.where(provider_id: current_provider.id)
  end

  def showmessages
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(conversation_id: @conversation)
  end

  private

  def conversation_params
    params.require(:conversation).permit(:provider_id)
  end

end