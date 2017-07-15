class ProvidersController < ApplicationController

  before_action :authenticate_user!, only: %i[like unlike book]
  before_action :authenticate_provider!, only: [:index]

  def index
    @new_joblistings = current_provider.joblistings.where(status: 2).order('created_at DESC')
    @current_joblistings = current_provider.joblistings.where(status: 3).order('created_at DESC')
    @past_joblistings = current_provider.joblistings.where(status: 4).order('created_at DESC')
    @schedule = if current_provider.schedule.present?
                  Schedule.find_by(provider_id: current_provider.id)
                else
                  Schedule.new
                end
    @provider = current_provider
  end

  def show
    @provider = Provider.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(provider_id: @provider.id)
    @conversation = Conversation.where(provider_id: @provider.id, user_id: current_user.id).first_or_create
  end

  def like
    @provider = Provider.find(params[:id])
    @like = @provider.likes.new
    @like.user = current_user
    if @like.save
      redirect_back(fallback_location: users_path)
    else
      redirect_back(fallback_location: users_path)
    end
  end

  def unlike
    @provider = Provider.find(params[:id])
    @like = @provider.likes.find_by(user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: users_path)
  end

  def book
    @provider = Provider.find(params[:id])
    @joblisting = Joblisting.find(params[:joblisting_id])
    @joblisting.update(provider_id: @provider.id, status: 'pending')
    @conversation = Conversation.where(provider_id: @provider.id, user_id: current_user.id).first_or_create
    @message = Message.new(conversation_id: @conversation.id, user_id: current_user.id, provider_id: @conversation.provider_id, body: 'You have a new request!')
    @message.body = current_user.firstname + ' : ' + @message.body + " #{view_context.link_to('View the Joblistng here', joblisting_path(@joblisting))} "
    @message.save
    @message.update(userticks: 'blue')
    redirect_to users_path
  end

end
