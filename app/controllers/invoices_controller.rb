class InvoicesController < ApplicationController

  def index; end

  def show; end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice.provider = current_provider
    @invoice = Invoice.new(invoice_params)
    if @invoice.save!
      redirect_to
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
