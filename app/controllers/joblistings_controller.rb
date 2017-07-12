class JoblistingsController < ApplicationController

  before_action :authenticate_user!, only: %i[new create edit update]
  before_action :authenticate_provider!, only: %i[accept decline]

  before_action :set_joblisting, except: %i[index new create]

  def index
    @joblistings = Joblisting.all
  end

  def show; end

  def new
    @joblisting = Joblisting.new
  end

  def create
    @joblisting = Joblisting.new(joblisting_params)
    @joblisting.user = current_user
    @joblisting.status = 'created'
    if @joblisting.save
      redirect_to result_path(job_date: @joblisting.date)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @joblisting.update(joblisting_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy; end

  def accept
    @joblisting.update(status: 'booked')
    @conversation = Conversation.where(provider_id: current_provider.id, user_id: @joblisting.user_id).first_or_create
    @message = Message.new(conversation_id: @conversation.id, provider_id: current_provider.id, user_id: @joblisting.user_id, body: 'I have accepted your request!')
    @message.body = current_provider.firstname + ' : ' + @message.body
    @message.save
    @message.update(providerticks: 'blue')
    redirect_to providers_path
  end

  def decline
    @joblisting.update(provider_id: nil, status: 'cancel')
    @conversation = Conversation.where(provider_id: current_provider.id, user_id: @joblisting.user_id).first_or_create
    @message = Message.new(conversation_id: @conversation.id, provider_id: current_provider.id, user_id: @joblisting.user_id, body: 'I have declined your request. Please find another provider. Thank you!')
    @message.body = current_provider.firstname + ' : ' + @message.body + " #{view_context.link_to('View your Joblsitings here!', users_path)} "
    @message.save
    @message.update(providerticks: 'blue')
    redirect_to providers_path
  end

  private

  def joblisting_params
    params.require(:joblisting).permit(:description, :num_fixture, :job_address, :time, :date, :housing, fixture: [], issue: [])
  end

  private

  def set_joblisting
    @joblisting = Joblisting.find(params[:id])
  end

end
