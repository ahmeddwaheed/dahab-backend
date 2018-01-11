class UsersController < ApplicationController
    before_action :authenticate_request!
    before_action :set_user, only: [:show, :update, :destroy]

    # def index
    #     @users = User.all
    #     json_response(users:@users)
    # end

    def update
        if current_user.update_attributes user_params
            render json: {status: 'SUCCESS', message: 'User Updated', data: current_user}, status: :ok
        else
            render json: { errors: current_user.errors.full_messages }, status: :bad_request
        end
    end

    def show
        render json: {user: current_user}
    end

    def currentUser
        render json: current_user
    end

    def destroy
        @user.destroy
        render json: { errors: @user.errors.full_messages }, status: :bad_request
    end

    private
    def user_params
        params.permit(:name, :avatar)
    end

    def set_user
        @user = User.find(params[:id])
    end
end
