class UsersController < ApplicationController

  require 'time'

  def index
    @new_joblistings = current_user.joblistings.where(status:[1, 5]).order('created_at DESC')
    @current_joblistings = current_user.joblistings.where(status:[2, 3]).order('created_at DESC')
    @past_joblistings = current_user.joblistings.where(status:4).order('created_at DESC')
  end

  def show
    @user = User.find(params[:id])
  end

  def urgent
    @job_time = Time.now
    @list_num = 3
    get_list_of_electricians
    @page = 'urgent_job'
  end

  def result
    if params[:job_date] != nil
      get_time_adjust(params[:job_date])
      @job_time = Time.now + @time_adjust.days
    else
      @joblisting = Joblisting.find(params[:job_id])
      get_time_adjust(@joblisting.date)
      @job_time = @joblisting.created_at + @time_adjust.days      
    end
    @list_num = Provider.count
    get_list_of_electricians
    @page = 'standard_job'
    @joblisting = current_user.joblistings.last
  end

  def electricians
    @electricians = Provider.all.page(params[:page]).per_page(10)
    @page = 'all_electricians'
  end

  private

  def get_time_adjust(job_date)
    if job_date == 'Within 5 days'
      @time_adjust = 5
    elsif job_date == 'Within 2 weeks'
      @time_adjust = 14
    else
      @time_adjust = 31
    end
  end

  def get_list_of_electricians
    if @job_time.sunday? || @job_time.saturday?
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
    @electricians_arr = Provider.where(id: @schedules_arr).order('experience DESC').pluck(:id)
    @electricians_list = Provider.where(id: @electricians_arr).order('experience DESC')
    @electricians = @electricians_list.paginate(:page => params[:page], :per_page => 10)
  end

end
