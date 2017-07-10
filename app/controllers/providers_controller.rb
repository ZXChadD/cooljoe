class ProvidersController < ApplicationController

  def index; end

  def show; end

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

end
