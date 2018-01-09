class AdminSessionController < ApplicationController
    def create
        @admin = Admin.find_by email: params[:email]
        if @admin && @admin.authenticate(params[:password])
            render json: response_obj(@admin), status: :ok
        else
            render json: {message: 'Invalid email/password'}, status: :unauthorized
        end
    end

    def logout

    end

    private
    def response_obj(admin)
        {
            auth_token: JsonWebToken.encode({admin_id: admin.id, name: admin.name}),
            admin: {admin_id: admin.id, name: admin.name, email: admin.email}
        }
    end
end
