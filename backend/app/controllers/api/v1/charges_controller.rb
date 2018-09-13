class Api::V1::ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = params[:charge][:_json]

    charge = Stripe::Charge.create(
      :source      => 'tok_visa',
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    begin
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
      render json: charge
    end
    private

    def charge_params
      params.permit(:token, :charge)
    end
  end
