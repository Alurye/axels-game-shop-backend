class ApplicationController < ActionController::API

  private

  def encode_token(payload)
    JWT.encode(payload, secret, algorithm)
  end

  def login_admin(username, password)

    admin = Admin.find_by(username: username)
    if admin && admin.authenticate(password)
      admin
    else
      raise AuthError
    end
  end

  def currentAdmin
    Admin.find_by(id: admin_id_from_token(token))
  end

  def admin_id_from_token(token)
    decode_token(token).first['admin_id']
  end

  def decode_token(token)
    puts 'REQUEST MADE: ', token
    if (token)
      begin
        JWT.decode(token, secret, true, { algorithm: algorithm })
      rescue
        return [{}]
      end
    else
      return [{}]
    end
  end

  def token
    request.headers['Authorization']
  end

  def secret
    "rehtag"
  end

  def algorithm
    "HS256"
  end
end

class AuthError < StandardError
  def initialize(msg="No admin or invalid password")
    super
  end
end
