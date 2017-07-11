class JoblistingsController < ApplicationController

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

  def update; end

  def destroy; end

  def accept
    @joblisting = Joblisting.find(params[:id])
    @joblisting.update(status: 'booked')
    redirect_to providers_path
  end

  def decline
    @joblisting = Joblisting.find(params[:id])
    @joblisting.update(provider_id: nil, status: 'cancel')
    redirect_to providers_path
  end

  private

  def joblisting_params
    params.require(:joblisting).permit(:description, :num_fixture, :job_address, :time, :date, :housing, fixture: [], issue: [])
  end

end
