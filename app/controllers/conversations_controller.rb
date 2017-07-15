class ConversationsController < ApplicationController

  before_action :authenticate_user!, only: %i[index show]
  before_action :authenticate_provider!, only: %i[allmessages showmessages]

  def index
    @conversations = Conversation.where(user_id: current_user.id)
    @conversation = Conversation.new
    @providers = Provider.all
    @message = Message.new
  end

  def show
    @conversation = Conversation.find(params[:id])
    if @conversation.messages.present?
      @messages = @conversation.messages.update(userticks: 'blue')
    end
    @message = Message.new(conversation_id: @conversation)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.user = current_user
    if @conversation.save
      redirect_to conversations_path
    else
      redirect_to conversations_path(current_user.id)
      flash[:error] = 'Conversation already exists'
    end
  end

  def allmessages
    @conversations = Conversation.where(provider_id: current_provider.id)
    @message = Message.new
  end

  def showmessages
    @conversation = Conversation.find(params[:conversation_id])
    if @conversation.messages.present?
      @messages = @conversation.messages.update(providerticks: 'blue')
    end
    @message = Message.new(conversation_id: @conversation)
    respond_to do |format|
      format.js
      format.html
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:provider_id)
  end

end
