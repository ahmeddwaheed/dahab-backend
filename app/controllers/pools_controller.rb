class PoolsController < ApplicationController
  before_action :set_pool, only: [:show, :update, :destroy]
  before_action :authenticate_admin!, only: [:create, :update, :destory]
    def index
      # current_user.pools.where(status: params[:status])
        if current_user
          :authenticate_request!
          pools = if params[:status] == 'comming'
                    Pool.where(status:'comming')
                  elsif params[:status].present?
                    current_user.pools.where(status: params[:status])
                  else
                    current_user.pools.where.not(status: 'comming') + Pool.where(status: 'comming')
                  end
        elsif current_admin
          :authenticate_admin!
          pools = if params[:status].present?
                    Pool.where status: params[:status]
                  else
                    Pool.order('created_at DESC');
                  end
        end
        render json: {status: 'SUCCESS', message: 'Loaded Pools', data: pools}, status: :ok
    end

    def show
      if current_user
        :authenticate_request!
      elsif current_admin
        :authenticate_admin!
      end
      user_pool = UserPool.all
      @user_card = user_pool.where!(pool_id:params[:id])
      @array_of_cards = []
      @card = {}
      current_user_in_pool = false
      for i in (0...@user_card.count)
        j = @user_card[i][:position]
        @array_of_cards[j - 1] = @user_card[i]
        current_user_in_pool = true if current_user && @user_card[i].user_id == current_user.id
      end
      for i in (0...@pool.seat_number)
        if !@array_of_cards[i]
          @card = {
                  :id => nil,
                  :user_id => nil,
                  :pool_id => @pool.id,
                  :position => i + 1,
                  :created_at => nil,
                  :updated_at => nil,
                  :avatar => "http://bit.ly/2mhzC6H"
                }
        @array_of_cards[i] = @card
        end
      end
      render json: {status: 'SUCCESS', message: 'Loaded Pool', data: @pool, userCard: @array_of_cards, current_user_in_pool: current_user_in_pool}, status: :ok
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

      @pool.turn = 1
      if @pool.update_attributes pool_params
        render json: {status: 'SUCCESS', message: 'Updated Pool', data: @pool}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Pool not Updated', data: @pool.errors}, status: :unprocessable_entity
      end
    end

    def destroy
      @pool.destroy
      render json: {status: 'SUCCESS', message: 'Deleted Pool'}, status: :ok
    end

    private

    def set_pool
      @pool = Pool.find params[:id]
    end

    def pool_params
      params.permit(:name, :amount, :monthly_amount, :seat_number,:number_of_users, :status, :turn,:admin_id, :launch_date, :end_date)
    end
end
