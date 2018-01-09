class SessionsController < ApplicationController
    def create
        @user = User.find_by email: params[:email]
        if @user && @user.authenticate(params[:password])
            render json: response_obj(@user), status: :ok
        else
            render json: {message: 'Invalid email/password'}, status: :unauthorized
        end
    end

    def logout

    end

    private
    def response_obj(user)
        {
            auth_token: JsonWebToken.encode({user_id: user.id, name: user.name}),
            user: {user_id: user.id, name: user.name, email: user.email, in_pool: user.in_pool, avatar: user.avatar}
        }
    end
end
