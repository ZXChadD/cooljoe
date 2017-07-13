class InvoicesController < ApplicationController

  def index; end

  def show; end

  def new
    @invoice = Invoice.new
    @joblisting = Joblisting.find(params[:joblisting_id])
    @@joblisting_id = @joblisting
    @invoice_number = "CoolJoe_INV_" + SecureRandom.hex(3)
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @joblisting = @@joblisting_id
    @invoice.provider = current_provider
    if @invoice.save!
    @joblisting.update(status: 'completed')
      redirect_to providers_path
    else
      render 'new'
    end
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy!
    redirect_to providers_path
  end

  private

  def invoice_params
    params.require(:invoice).permit(:provider_id, :joblisting_id, :invoice_ref, :price, :status, :job_description)
  end
end
