class RequestsController < ApplicationController

    before_action :set_request, except: [:index]
    before_action :set_user_request, only: [:show, :destory]

    def index
        @requests = Request.all
        json_response(@requests)
    end
    
    def show
        json_response(@request)
    end

    def new
        @request = @user.requests.new
    end

    def create
        @request = @user.requests.new request_params
        if @request.save
            json_response(@user, :created)
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
        params.require(:request).permit(:is_accepted, :program, :reason, :background)
    end 

    def set_request
        @user = User.find(params[:user_id])
    end 

    def set_user_request
        @request = @user.requests.find_by!(id: params[:id]) if @user
    end
end
