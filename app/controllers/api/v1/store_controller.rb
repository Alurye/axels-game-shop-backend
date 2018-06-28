class Api::V1::StoreController < ApplicationController
  before_action :find_store, only: [:update]
 def index
   @stores = Store.all
   render json: @stores
 end

 def update
   @store.update(store_params)
   if @store.save
     render json: @store, status: :accepted
   else
     render json: { errors: @store.errors.full_messages }, status: :unprocessible_entity
   end
 end

 private

 def store_params
   params.permit(:title, :content)
 end

 def find_store
   @store = Store.find(params[:id])
 end
end
