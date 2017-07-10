class UsersController < ApplicationController

  require 'time'

  def index
    @joblistings = current_user.joblistings.order(:created_at).reverse
    @current_joblistings = current_user.joblistings.where(status:1) + current_user.joblistings.where(status:2)
    @past_joblistings = current_user.joblistings.where(status:3) + current_user.joblistings.where(status:4)
  end

  def show
    @user = User.find(params[:id])
  end

  def urgent
    @time_now = Time.now
    @list_num = 3
    get_list_of_electricians
    @page = 'urgent_job'
  end

  def result
    @time_adjust = params[:job_date].to_i
    @time_now = Time.now + @time_adjust.days
    @list_num = Provider.count
    get_list_of_electricians
    @page = 'standard_job'
  end

  def electricians
    @electricians = Provider.all
    @page = 'all_electricians'
  end

  private

  def get_list_of_electricians
    if @time_now.sunday? || @time_now.saturday?
      @time = 'weekends'
      get_sub_list_electricians
    else
      @time = 'weekdays'
      get_sub_list_electricians
    end
  end

  def get_sub_list_electricians
    @sorted_electricians = Provider.experiences
    @electricians = []
    @sorted_electricians.each do |electrician|
      if @electricians.count < @list_num
        if electrician.schedule.date == @time || electrician.schedule.date == 'all'
          @electricians.push(electrician)
        end
      else
        break
      end
    @electricians
    end
  end

end
