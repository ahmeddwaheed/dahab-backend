class UsersController < ApplicationController
    before_action :authenticate_request!
    before_action :set_user, only: [:show, :update, :destroy]

    # def index
    #     @users = User.all
    #     json_response(users:@users)
    # end

    def update
        @user.update(user_params)
        render json: { errors: @user.errors.full_messages }, status: :bad_request
    end

    def show
        render json: {user: @current_user}
    end

    def destroy
        @user.destroy
        render json: { errors: @user.errors.full_messages }, status: :bad_request
    end

    private
    
    def set_user
        @user = User.find(params[:id])
    end
end
