class PoolsController < ApplicationController

  before_action :set_pool, only: [:show, :update, :destroy]

  def index
      pools = Pool.order('created_at DESC');
      render json: {status: 'SUCCESS', message: 'Loaded Pools', data: pools}, status: :ok
    end

    def show
      user_pool = UserPool.all
      @user_card = user_pool.where!(pool_id:params[:id])
      @array_of_cards = []
      @card = {}
      for i in (0...@user_card.count)
        j = @user_card[i][:position]
        @array_of_cards[j - 1] = @user_card[i]
      end
      for i in (0...@pool.seat_number)
        if !@array_of_cards[i]
          @card = {
                  :id => nil,
                  :user_id => nil,
                  :pool_id => 1,
                  :position => i + 1,
                  :created_at => nil,
                  :updated_at => nil
                }
        @array_of_cards[i] = @card
        end
      end
      render json: {status: 'SUCCESS', message: 'Loaded Pool', data: @pool, userCard: @array_of_cards}, status: :ok
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

    def set_pool
      @pool = Pool.find params[:id]
    end

    def pool_params
      params.permit(:name, :amount, :monthly_amount, :seat_number, :status, :turn,:admin_id, :launch_date, :end_date)
    end
end
