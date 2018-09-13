class Api::V1::GameOrdersController < ApplicationController
  before_action :find_game_order, only: [:update]
 def index
   @game_orders = GameOrder.all
   render json: @game_orders
 end


 def create
   @game = Game.create(game_order_params)
   render json: @game
 end


 def update
   @game_order.update(game_order_params)
   if @game_order.save
     render json: @game_order, status: :accepted
   else
     render json: { errors: @game_order.errors.full_messages }, status: :unprocessible_entity
   end
 end

 private

 def game_order_params
   params.permit(:order_id, :game_id)
 end

 def find_game_order
   @game_order = GameOrder.find(params[:id])
 end
end
