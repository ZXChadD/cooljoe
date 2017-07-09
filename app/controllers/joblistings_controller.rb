class JoblistingsController < ApplicationController

  def index; end

  def show; end

  def new
    @joblisting = Joblisting.new
  end

  def new; end

  def create; end

  def edit; end

  def update; end

  def destroy; end

  private

  def joblisting_params
    params.require(:joblisting).permit(:description, :fixture, :num_fixture, :housing, :job_address, :date, :time, type:[])
  end
end
