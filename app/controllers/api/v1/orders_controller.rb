class Api::V1::OrdersController < ApplicationController
  before_action :find_order, only: [:update]
 def index
   @orders = Order.all
   render json: @orders
 end

 def create
   @order = Order.create(order_params)
   render json: @order
 end


 def update
   @order.update(order_params)
   if @order.save
     render json: @order, status: :accepted
   else
     render json: { errors: @order.errors.full_messages }, status: :unprocessible_entity
   end
 end

 private

 def order_params
   params.permit(:first_name, :last_name, :e_mail,:address, :address_2,:state,:country,:zip_code, :store_id, :order_number)
 end

 def find_order
   @order = Order.find(params[:id])
 end
end
