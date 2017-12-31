class ApplicationController < ActionController::API
    include Response
    include ExceptionHandler



        #### Authentication ####

    require 'json_web_token'
    def login
        user = User.find_by(email: params[:email].to_s.downcase)
      
        if user && user.authenticate(params[:password])  ### The authenticate method is provided by the has_secure_password helper.
            if user.confirmed_at?
                auth_token = JsonWebToken.encode({user_id: user.id}) ### LEEEEH?
                render json: {auth_token: auth_token}, status: :ok
            end
        else
          render json: {error: 'Invalid email / password'}, status: :unauthorized
        end
    end

    protected
    # Validates the token and user and sets the @current_user scope
    def authenticate_request!
        if !payload || !JsonWebToken.valid_payload(payload.first)            
            return invalid_authentication
        end
    end

    def load_current_user!
        invalid_authentication unless @current_user
    end

    # Returns 401 response. To handle malformed / invalid requests.
    def invalid_authentication
        render json: {error: 'Invalid Request'}, status: :unauthorized
    end

    private
    # Deconstructs the Authorization header and decodes the JWT token.
    def payload
        auth_header = request.headers['Authorization']
        token = auth_header.split(' ').last
        JsonWebToken.decode(token)
        rescue
        nil
    end

    # Sets the @current_user with the user_id from payload
    def load_current_user!
        @current_user = User.find_by(id: payload[0]['user_id'])
    end
end
