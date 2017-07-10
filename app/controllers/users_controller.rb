class UsersController < ApplicationController
  require 'time'

  def index
  end

  def show
    @user = User.find(params[:id]) 
  end

  def urgent
    @time_now = Time.now
    @list_num = 3
    get_list_of_electricians
  end

  def result
    @time_adjust = params[:job_date].to_i
    @time_now = Time.now + @time_adjust.days
    @list_num = Provider.count
    get_list_of_electricians
  end

  def electricians
    @electricians = Provider.all
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
