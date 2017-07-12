class UsersController < ApplicationController

  require 'time'

  def index
    @new_joblistings = current_user.joblistings.where(status: [1, 5]).order('created_at DESC')
    @current_joblistings = current_user.joblistings.where(status: [2, 3]).order('created_at DESC')
    @past_joblistings = current_user.joblistings.where(status: 4).order('created_at DESC')
    @user_invoice = @past_joblistings.find_by(status: 4).invoice
  end

  def show
    @user = User.find(params[:id])
  end

  def urgent
    @job_time = Time.now
    @list_limit = 3
    @page_limit = 3
    get_list_of_electricians
    @page = 'urgent_job'
  end

  def result
    # get the @time_adjust and @job_time
    if params[:job_date] != nil
      get_time_adjust(params[:job_date])
      @job_time = Time.now + @time_adjust.days
      @joblisting = current_user.joblistings.last
    elsif params[:job_id] != nil
      @joblisting = Joblisting.find(params[:job_id])
      get_time_adjust(@joblisting.date)
      @job_time = @joblisting.created_at + @time_adjust.days
    end

    # the id params is present when clicking the 'load-more' button
    if params[:id]
      # get all records with id not shown yet
      @page_limit = 5
      @electricians_arr = params[:providers_id_arr]
      current_index = @electricians_arr.index(params[:id])
      render_electricians_arr = @electricians_arr[current_index+1..current_index+@page_limit]
      @joblisting = Joblisting.find(params[:job_id])
      get_list_of_electricians2(render_electricians_arr)
    else
      # get initial list of providers
      @list_limit = Schedule.count
      @page_limit = 5
      get_list_of_electricians
    end

    @page = 'standard_job'
    @electricians_arr
    respond_to do |format|
      format.html
      format.js
    end
  end

  def electricians
    @electricians = Provider.all.page(params[:page]).per_page(10)
    @page = 'all_electricians'
  end

  private

  def get_time_adjust(job_date)
    @time_adjust = if job_date == 'Within 5 days'
                     5
                   elsif job_date == 'Within 2 weeks'
                     14
                   else
                     31
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

  def get_list_of_electricians2(render_electricians_arr)
    @electricians = render_electricians_arr.map do |provider_id|
      Provider.find(provider_id)
    end
  end

  def get_sub_list_electricians
    @schedules = Schedule.where(date: [@date, 'all'])
    @schedules_arr = @schedules.limit(@list_limit).pluck(:id)
    @electricians_arr = Provider.where(id: @schedules_arr).order('experience DESC').pluck(:id)
    @render_electricians_arr = @electricians_arr[0...@page_limit]
    @electricians = Provider.where(id: @render_electricians_arr).order('experience DESC')
  end

end
