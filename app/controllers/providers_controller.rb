class ProvidersController < ApplicationController
  def index
  end

  def show
    @provider = Provider.find(params[:id])
  end
 
end
