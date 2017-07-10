class JoblistingsController < ApplicationController

  def index; end

  def show; end

  def new
    @joblisting = Joblisting.new
  end

  def create
    @joblisting = Joblisting.new(joblisting_params)
    @joblisting.user = current_user
    if @joblisting.save
      redirect_to result_path(job_date: @joblisting.date)
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def joblisting_params
    params.require(:joblisting).permit(:description, :num_fixture, :job_address, :time, date:[], housing:[], fixture:[], issue:[], job_attaches_attributes: [:id, :image, :job_id, :title, :_destroy ])
  end

end
