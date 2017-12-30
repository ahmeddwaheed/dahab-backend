class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    def index
        @users = User.all
        json_response(users:@users)
    end

    def create
        @user = User.new user_params
        if @user.save
            render json: {user: @user}
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


    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def set_user
        @user = User.find(params[:id])
    end
end
