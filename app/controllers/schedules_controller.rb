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
    params.require(:schedule).permit(date:[], time:[])
  end
end
