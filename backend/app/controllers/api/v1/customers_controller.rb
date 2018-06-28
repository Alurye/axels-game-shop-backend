class Api::V1::CustomersController < ApplicationController
  before_action :find_customer, only: [:update]
 def index
   @customers = Customer.all
   render json: @customers
 end

 def update
   @customer.update(customer_params)
   if @customer.save
     render json: @customer, status: :accepted
   else
     render json: { errors: @customer.errors.full_messages }, status: :unprocessible_entity
   end
 end

 private

 def customer_params
   params.permit(:title, :content)
 end

 def find_customer
   @customer = Customer.find(params[:id])
 end
end
