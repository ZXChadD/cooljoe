class Admin::JoblistingsController < ApplicationController

  before_action :is_admin?

  def index
    @joblistings = Joblisting.all.page(params[:page]).per_page(10)
    @all_projects_total_cost = 0
    Invoice.all.map { |invoice| @all_projects_total_cost += invoice.price }
  end

  def edit; end

  def update; end

  def destroy; end

  private

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
