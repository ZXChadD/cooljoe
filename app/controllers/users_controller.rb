class UsersController < ApplicationController

  def index; end

  def show;
    @user = User.find(params[:id]) 
  end

  def urgent; end

  def result; end

  def electricians; end

end
