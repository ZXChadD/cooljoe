class ProvidersController < ApplicationController

  def index
    @new_joblistings = current_provider.joblistings.where(status: 2).order('created_at DESC')
    @current_joblistings = current_provider.joblistings.where(status: 3).order('created_at DESC')
    @past_joblistings = current_provider.joblistings.where(status: 5).order('created_at DESC')
    
    @schedule = if current_provider.schedule.present?
                  Schedule.find_by(provider_id: current_provider.id)
                else
                  Schedule.new
                end
    @provider = current_provider
  end

  def show
    @provider = Provider.find(params[:id])
  end

  def like
    @provider = Provider.find(params[:id])
    @like = @provider.likes.new
    @like.user = current_user
    if @like.save
      redirect_back(fallback_location: users_path)
    else
      redirect_back(fallback_location: users_path)
    end
  end

  def unlike
    @provider = Provider.find(params[:id])
    @like = @provider.likes.find_by(user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: users_path)
  end

  def book
    @provider = Provider.find(params[:id])
    @joblisting = Joblisting.find(params[:joblisting_id])
    @joblisting.update(provider_id: @provider.id, status: 'pending')
    redirect_to users_path
  end

end
