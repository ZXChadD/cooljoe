class UsersController < ApplicationController
  require 'time'

  def index
  end

  def show; end

  def urgent
    @time = Time.now.sunday?
    @electricians = Provider.all    
  end

  def result; end

  def electricians
    @electricians = Provider.all
  end

end
