class Api::V1::PurchasesController < ApplicationController
  before_action :find_purchase, only: [:update]
 def index
   @purchases = Note.all
   render json: @purchases
 end

 def update
   @purchase.update(purchase_params)
   if @purchase.save
     render json: @purchase, status: :accepted
   else
     render json: { errors: @purchase.errors.full_messages }, status: :unprocessible_entity
   end
 end

 private

 def purchase_params
   params.permit(:title, :content)
 end

 def find_purchase
   @purchase = Purchase.find(params[:id])
 end
end
