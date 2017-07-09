class JoblistingsController < ApplicationController

  def index; end

  def show; end

  def new
    @joblisting = Joblisting.new
  end

  def create
    @joblisting = Joblisting.new(joblisting_params)
    if @joblisting.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def joblisting_params
    params.require(:joblisting).permit(:description, :num_fixture, :housing, :job_address, :date, :time, fixture:[], type:[])
  end
end
