class Api::V1::AdminController < ApplicationController
  before_action :find_admin, only: [:update]
 def index
   @admin = Admin.all
   render json: @admin
 end

 def update
   @admin.update(admin_params)
   if @admin.save
     render json: @admin, status: :accepted
   else
     render json: { errors: @admin.errors.full_messages }, status: :unprocessible_entity
   end
 end

 private

 def admin_params
   params.permit(:first_name, :last_name)
 end

 def find_admin
   @admin = Customer.find(params[:id])
 end
end
