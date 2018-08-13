class Api::V1::SessionsController < ApplicationController
  def create
    
      @admin = Admin.find_by(username: params["username"])
      if (@admin && @admin.authenticate(params["password"]))
        token = encode_token({
              username: @admin.username,
              id: @admin.id
          })
        render json: {
          token: token,
          id: @admin.id
        }
      else
        render json: {
          errors: "Those credentials don't match anything we have in our database"
        }, status: :unauthorized
      end
    end
end
