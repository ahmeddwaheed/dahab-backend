class UsersController < ApplicationController

    before_action :set_user, only: [:show, :update, :destroy]

    def index
        @users = User.all
        json_response(@users)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new user_params
        if @user.save
            render json: {user: @user}
        else
            head :no_content
        end
    end

    def update
        @user.update(user_params)
        head :no_content
    end

    def show
        render json: {user: @user}
    end

    def destroy
        @user.destroy
        head :no_content
    end


    private

    def user_params
        params.require(:user).permit(:username, :password, :email, :in_pool)
    end
    
    def set_user
        @user = User.find(params[:id])
    end
end
