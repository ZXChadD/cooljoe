class AdminController < ApplicationController
	before_action :is_admin?

	def statistics

	end

  def is_admin?
  	if current_user && current_user.is_admin == false
  		redirect_to users_path
  	elsif current_provider
  		redirect_to providers_path
  	elsif current_user == nil && current_provider == nil
    	redirect_to homepage_path
    end
  end	

end