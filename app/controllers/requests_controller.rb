class RequestsController < ApplicationController

    # before_action :set_request, except: [:index]
    # before_action :set_user_request, only: [:show, :destory]
    before_action :set_request, only:[:show, :destroy]

    def index
        @requests = Request.all
        json_response(@requests)
    end
    
    def show
        render json: {request: @request}
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
        params.require(:request).permit(:is_accepted, :program, :reason, :background, :user_id, :pool_id)
    end 

    def set_request
        @request = Request.find(params[:id])
    end 

end
