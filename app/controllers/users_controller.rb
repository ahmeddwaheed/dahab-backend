class UsersController < ApplicationController
    before_action :authenticate_request!
    before_action :set_user, only: [:show, :update, :destroy]

    def index
        @users = User.all
        json_response(users:@users)
    end

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

    def confirm
        token = params[:token].to_s
      
        user = User.find_by(confirmation_token: token)
      
        if user.present? && user.confirmation_token_valid?
          user.mark_as_confirmed!
          render json: {status: 'User confirmed successfully'}, status: :ok
        else
          render json: {status: 'Invalid token'}, status: :not_found
        end
    end

    private

    def user_params
        params.permit(:name, :email, :password, :password_confirmation)
    end
    
    def set_user
        @user = User.find(params[:id])
    end

end
