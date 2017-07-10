module SchedulesHelper

  def checked_d(area)
    @schedule.date.nil? ? false : @schedule.date.match(area)
  end

  def checked_t(area)
    @schedule.time.nil? ? false : @schedule.time.match(area)
  end

end
