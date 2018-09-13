class Api::V1::GamesController < ApplicationController
  before_action :find_game,  only: [:update, :show]
  # before_action :requires_login, only: [:index]


 def index
       @games = Game.all
       # @order = Order.find(params[:order_id])
       # @games = @order.games
       render json: @games

 end

 def update
   @game.update(game_params)
   if @game.save
     render json: @game, status: :accepted
   else
     render json: { errors: @game.errors.full_messages }, status: :unprocessible_entity
   end
 end

def show
  render json: @game
end


 def create
   @game = Game.create(game_params)
   render json: @game
 end

 def destroy
   @game = Game.find(params[:id])
   @game.destroy
   render json: @games

 end

 private

 def game_params
   params.permit(:title, :console, :quantity, :price, :genre, :img, :description, :store_id)
 end

 def find_game
   @game = Game.find(params[:id])
 end

end
