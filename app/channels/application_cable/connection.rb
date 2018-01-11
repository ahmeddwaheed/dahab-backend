module ApplicationCable
  class Connection < ActionCable::Connection::Base
    require 'json_web_token'
    identified_by :current_user

    def connect
      current_user = find_verified_user
      # logger.add_tags 'ActionCable', current_user.name
    end

    protected
    # wss://localhost:3000/cable?token=jwt
    def session_info
        @session_info ||= JsonWebToken.decode(request.params[:token])
    end

    def find_verified_user

      if session_info[:user_id]
        current_user = User.find session_info[:user_id]
      else
        reject_unauthorized_connection
      end
    end
  end
end
# current_user = User.find_by(auth_token: request.params[:auth_token])
