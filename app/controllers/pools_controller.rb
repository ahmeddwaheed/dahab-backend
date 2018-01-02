class PoolsController < ApplicationController

  before_action :set_pool, only: [:show, :update, :destroy]
  before_action :set_user, only: [:index]
    def index
      # current_user.pools.where(status: params[:status])

      if @current_user
        if params[:status] == 'comming'
          pools = Pool.where(status:'comming')
          render json: {status: 'SUCCESS', message: 'Loaded Pools', data: pools}, status: :ok
        else
          pools = @current_user.pools.where(status: params[:status])
          render json: {status: 'SUCCESS', message: 'Loaded Pools', data: pools}, status: :ok
        end
      else
        if params[:status].present?
          pools = Pool.where status: params[:status]
          render json: {status: 'SUCCESS', message: 'Loaded Pools', data: pools}, status: :ok
        else
          pools = Pool.order('created_at DESC');
          render json: {status: 'SUCCESS', message: 'Loaded Pools', data: pools}, status: :ok
        end
      end
    end

    def show
      render json: {status: 'SUCCESS', message: 'Loaded Pool', data: pool}, status: :ok
    end

    def create
      pool = Pool.new pool_params
      if pool.save
        render json: {status: 'SUCCESS', message: 'Saved Pool', data: pool}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Pool not saved', data: pool.errors}, status: :unprocessable_entity
      end
    end

    def update
      if pool.update_attributes pool_params
        render json: {status: 'SUCCESS', message: 'Updated Pool', data: pool}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Pool not Updated', data: pool.errors}, status: :unprocessable_entity
      end
    end

    def destroy
      pool.destroy
      render json: {status: 'SUCCESS', message: 'Deleted Pool'}, status: :ok
    end


    private
    def set_user
      @current_user = User.find params[:id]
    end
    def set_pool
      @pool = Pool.find params[:id]
    end

    def pool_params
      params.permit(:name, :amount, :monthly_amount, :seat_number, :status, :turn,:admin_id, :launch_date, :end_date)
    end
end
