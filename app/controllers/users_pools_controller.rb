class UsersPoolsController < ApplicationController
    before_action :authenticate_request!, expect: [:launch]
    attr_accessor :name
    attr_accessor :avatar

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
            @users_pool = UserPool.new users_pool_params
            @users_pool.name = @user.name
            @users_pool.avatar = @user.avatar.url

            if @users_pool.save
                @user.update(in_pool: true)
                @pool.number_of_users += 1
                @pool.save!
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
        # @users_pool.destroy
        render json: { errors: @users_pool.errors.full_messages }, status: :bad_request
    end

    private
    def users_pool_params
        params.permit(:user_id, :pool_id, :position).merge(name: @name)
    end

    def launch
        :authenticate_admin!
      PaymentNotificationJob.set(wait: 1.month).perform_later
    end

    # def launch
    #   PaymentNotificationJob.set(wait: 1.month).perform_later(@user)
    # end
end
