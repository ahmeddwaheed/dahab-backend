class UsersPoolsController < ApplicationController

    attr_accessor :name

    def index
        @users_pools = UserPool.all
        render json: @users_pools
    end

    def create
        user_exists = UserPool.find_by(user_id: params[:user_id])
        seat = UserPool.where(position: params[:position])
        @pool = Pool.find(params[:pool_id])
        @user = User.find(params[:user_id])

        if !user_exists && seat.empty?
            self.name = @user.name
            @users_pool = UserPool.new users_pool_params
            if @users_pool.save
                @user.in_pool = true
                @user.save
                @pool.number_of_users += 1
                @pool.save
                render json:{users_pools: @users_pool}
            else
                render json: { errors: @users_pool.errors.full_messages }, status: :bad_request
            end
        else
            render json: {message: "User already in pool or seat is taken"}, status: :bad_request
        end
    end

    def update
        @users_pool.update(users_pool_params)
        render json: { errors: @users_pool.errors.full_messages }, status: :bad_request
    end

    def destroy
        @users_pool.destroy
        render json: { errors: @users_pool.errors.full_messages }, status: :bad_request
    end

    private
    def users_pool_params
        params.permit(:user_id, :pool_id, :position).merge(name: @name)
    end

    def launch
      PaymentNotificationJob.set(wait: 1.month).perform_later
    end
end
