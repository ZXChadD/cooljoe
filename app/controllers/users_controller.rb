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
    @electricians = Provider.all.page(params[:page]).per_page(10)
    @page = 'all_electricians'
  end

  private

  def get_list_of_electricians
    if @time_now.sunday? || @time_now.saturday?
      @date = 'weekends'
      get_sub_list_electricians
    else
      @date = 'weekdays'
      get_sub_list_electricians
    end
  end

  def get_sub_list_electricians
    @schedules = Schedule.where(date: @date, date: 'all')
    @schedules_arr = @schedules.limit(@list_num).pluck(:id)
    @electricians_arr = Provider.where(id: @schedules_arr).experiences.pluck(:id)
    @electricians_list = Provider.where(id: @electricians_arr).order('experience DESC')
    @electricians = @electricians_list.paginate(:page => params[:page], :per_page => 10)
  end

end
