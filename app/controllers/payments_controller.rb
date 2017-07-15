class PaymentsController < ApplicationController

  TRANSACTION_SUCCESS_STATUSES = [
    Braintree::Transaction::Status::Authorizing,
    Braintree::Transaction::Status::Authorized,
    Braintree::Transaction::Status::Settled,
    Braintree::Transaction::Status::SettlementConfirmed,
    Braintree::Transaction::Status::SettlementPending,
    Braintree::Transaction::Status::Settling,
    Braintree::Transaction::Status::SubmittedForSettlement
  ].freeze

  def new
    @client_token = Braintree::ClientToken.generate
    @@user_invoice = Invoice.find(params[:id])
    @invoice = @@user_invoice
  end

  def show
    @transaction = Braintree::Transaction.find(params[:id])
    @invoice = Invoice.find(params[:invoice_id])
    @result = _create_result_hash(@transaction)
  end

  def create
    @invoice = @@user_invoice
    amount = params['amount'] # In production you should not take amounts directly from clients
    nonce = params['payment_method_nonce']

    result = Braintree::Transaction.sale(
      amount: amount,
      payment_method_nonce: nonce,
      options: {
        submit_for_settlement: true
      }
      
    )

    if result.success? || result.transaction
      @invoice.update(status: 2)
      redirect_to payment_path(result.transaction.id, invoice_id: @invoice.id)
    else
      error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
      flash[:error] = error_messages
      redirect_to new_payment_path
    end
  end

  def _create_result_hash(transaction)
    status = transaction.status

    result_hash = if TRANSACTION_SUCCESS_STATUSES.include? status
                    {
                      :header => "Sweet Success!",
                      :icon => "success",
                      :message => "Thank you, your payment for Invoice ref: #{@invoice.invoice_ref} has been successfully processed.",
                    }
                  else
                    {
                      :header => "Transaction Failed",
                      :icon => "fail",
                      :message => "Your transaction has a status of #{status}.Please try again."
                    }
                  end
  end

end
