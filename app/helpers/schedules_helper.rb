module SchedulesHelper

  def checked(area)
    @schedule.date.nil? ? false : @schedule.date.match(area)
    @schedule.time.nil? ? false : @schedule.time.match(area)
  end
end
