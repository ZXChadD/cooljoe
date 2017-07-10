class SchedulesController < ApplicationController
  def new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.provider = current_provider
    if @schedule.save!
      redirect_to providers_path
    end 
  end

  private
  def schedule_params
    params.require(:schedule).permit(date:[], time:[])
  end
end
