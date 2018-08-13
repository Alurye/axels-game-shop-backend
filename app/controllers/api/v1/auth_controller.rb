class Api::V1::AuthController < ApplicationController

  def login

      @admin = login_admin(params[:username], params[:password])
      render json: {
        admin: {
          username: admin.username,
          password: admin.password
        },
        token: encode_token({'admin_id': @admin.id})
      }
  end


  def signup
    # byebug
    @admin = Admin.new
    @admin.username = params[:username]
    @admin.password = params[:password]
    if @admin.save
      render json: {
        admin: @admin,
        token: encode_token({'admin_id': @admin.id})
        }
    else
      render json: {errors: @admin.errors.full_messages}, status: 422
    end
  end

  def get_current_user
    user = currentUser
    if user
      render json: {
        user: {
          id: user.id,
          username: user.username,
          firstname: user.first_name,
          lastname: user.last_name,

        },
        token: encode_token({'admin_id': @admin.id})
      }
    else
      render json: nil
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password)
  end

end
