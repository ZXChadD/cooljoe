class InvoicesController < ApplicationController

  def index; end

  def show; end

  def new
    @invoice = Invoice.new
  end

  def create
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

end
