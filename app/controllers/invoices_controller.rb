class InvoicesController < ApplicationController

  def index; end

  def show; end

  def new
    @invoice = Invoice.new
    @joblisting = Joblisting.find_by(params[:id])
    @invoice_number = "CoolJoe_inv_" + SecureRandom.hex(3)
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @joblisting = Joblisting.find_by(params[:id])
    @invoice.provider = current_provider
    if @invoice.save!
    @joblisting.update(status: 'completed')
      redirect_to providers_path
    else
      render 'new'
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def invoice_params
    params.require(:invoice).permit(:provider_id, :joblisting_id, :invoice_ref, :price, :status, :job_description)
  end
end
