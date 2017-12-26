class UsersPoolsController < ApplicationController
    def create
        @users_pool = Users_Pool.new users_pool_params
        if @users_pool.save
            render json:{users_pools: @users_pool}
        else
            head :no_content
        end
    end

    def update
        @users_pool.update(users_pool_params)
        head :no_content
    end

    def destroy
        @users_pool.destroy
        head :no_content
    end

    private 
    def users_pool_params
        params.require(:user).permit(:user_id, :pool_id, :position)
    end
end
