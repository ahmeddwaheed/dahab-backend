class UsersController < ApplicationController
    # before_action :authenticate_request!
    before_action :set_user, only: [:show, :update, :destroy]

    # def index
    #     @users = User.all
    #     json_response(users:@users)
    # end

    def create
        @user = User.new user_params
        if @user.save
            # render json: {user: @user}
            render json: {status: 'User created successfully'}, status: :created
        else
            render json: { errors: @user.errors.full_messages }, status: :bad_request
        end
    end

    def update
        @user.update(user_params)
        render json: { errors: @user.errors.full_messages }, status: :bad_request
    end

    def show
        render json: {user: @user}
    end

    def destroy
        @user.destroy
        render json: { errors: @user.errors.full_messages }, status: :bad_request
    end

        #### Authentication ####

    

    private

    def user_params
        params.permit(:name, :email, :password, :password_confirmation)
    end
    
    def set_user
        @user = User.find(params[:id])
    end

    def response_obj(user)
        {
          auth_token: JsonWebToken.encode({user_id: user.id})
        }
    end
end
