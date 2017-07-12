class AdminController < ApplicationController

  before_action :is_admin?

  def statistics
    # User ratio
    @users_count = User.count - 1
    @providers_count = Provider.count
    @total_count = @users_count + @providers_count
    @user_ratio_hash = { 'users' => @users_count, 'providers' => @providers_count }

    # Provider date types
    @providers = Provider.all

    # Joblisting status ratio
    @joblistings = Joblisting.all

    # Invoice status ratio
    @invoices = Invoice.all
  end

  def is_admin?
    if current_user && current_user.is_admin == false
      redirect_to users_path
    elsif current_provider
      redirect_to providers_path
    elsif current_user.nil? && current_provider.nil?
      redirect_to homepage_path
    end
  end

end
