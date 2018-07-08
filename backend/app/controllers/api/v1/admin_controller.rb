class Api::V1::AdminController < ApplicationController

  # before_action :requires_login, only: [:all_games]
  # before_action :requires_user_match, only: [:all_games]

  def  index
      @admins = Admin.all
      render json: @admins
  end

  def create
    @admin = Admin.new
    @admin.username = params[:username]
    @admin.password = params[:password]

    if (@admin.save)

      payload = {
        username: @admin.username,
        id: @admin.id
      }
      token = JWT.encode payload, ENV['JWT_SECRET'], 'HS256'
      render json: {
        token: token,
        id : @admin.id
      }
    else
    render json: {
    errors: @admin.errors.full_messages
    }, status: :unprocessable_entity
    end


  end



   def all_games
    render json: @games
  end
end
