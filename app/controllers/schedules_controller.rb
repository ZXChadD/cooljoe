class SchedulesController < ApplicationController
  before_action :authenticate_provider!

  def new; end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.provider = current_provider
    redirect_to providers_path if @schedule.save!
  end

  def edit; end

  def update
    @schedule = Schedule.find_by(provider_id: current_provider.id)
    if @schedule.update(schedule_params)
      redirect_to providers_path
    else
      render :edit
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(date: [], time: [])
  end

end
