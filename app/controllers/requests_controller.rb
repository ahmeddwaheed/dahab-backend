class RequestsController < ApplicationController
    before_action :authenticate_admin!, except: [:create]

    # before_action :set_request, except: [:index]
    # before_action :set_user_request, only: [:show, :destory]
    before_action :set_request, only:[:show, :destroy, :update]


    def index
        @requests = Request.all
        json_response(@requests)
    end

    def find_user
        @request = Request.all
        @request = @request.where!(user_id: params[:user_id])
        json_response(@request)
    end

    def find_pool
        @request = Request.all
        @request = @request.where!(pool_id: params[:pool_id])
        json_response(@request)
    end

    def show
        render json: {request: @request}
    end

    def accept
      if @request.accept
        render json: { message: "Accepted"}, status: :ok
      else
        render json: { message: "Failed", errors: @request.errors }, status: :unprocessable_entity
      end
    end

    def reject
      if @request.reject
        render json: { message: "Rejected"}, status: :ok
      else
        render json: { message: "Failed", errors: @request.errors }, status: :unprocessable_entity
      end
    end


    def create
        @request = Request.new request_params
        if @request.save
            render json: {request: @request}
        else
            head :no_content
        end
    end

    def destroy
        @request.destroy
        head :no_content
    end


    private

    def request_params
        params.permit(:is_accepted, :program, :reason, :background, :user_id, :pool_id)
    end

    def set_request
        @request = Request.find(params[:id])
    end

end
