class RequestsController < ApplicationController
  before_action :set_pool
  before_action :set_request, only: [:show, :destroy]
  def index
    @requests = @pool.requests
  end

  def show
    # show single request
  end

  def create
    @request = @pool.requests.build request_params

    if @request.save
      render :show, status: :created, location: [@pool, @request]
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @request.destroy
    render json: { operation: 'OK'}, status: :ok
  end

  private
  def set_pool
    @pool = Pool.find params[:pool_id]
  end

  def set_request
    @request = @pool.requests.find params[:id]
  end

  def request_params
    params.require(:request).permit(:reason, :background, :program)
  end
end
