class Api::V1::OrdersController < ApplicationController
  before_action :find_order, only: [:update, :show]
 def index
   @orders = Order.all

   render json: @orders, include: [:games]
 end

 def create

   @order = Order.create(order_params)
     params[:games].each do |game|
       @game = Game.find(game[:id])
       @order.games << @game
     end

   render json: @order, include: [:games]
 end

def show
 render json: @order, include: [:games]
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
   params.require(:order).permit(:first_name, :last_name, :e_mail,:address, :address_2,:state,:country,:zip_code, :store_id, :order_number, :games => [:id,:title, :console, :quantity, :price, :genre, :img, :description, :store_id, :created_at, :updated_at, :userQty])
 end

 def find_order
   @order = Order.find(params[:id])
 end
end
