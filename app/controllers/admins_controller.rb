class AdminsController < ApplicationController

  before_action :set_admin, only: [:show, :update, :destroy]

  def index
      admins = Admin.all;
      render json: {status: 'SUCCESS', message: 'Loaded Admins', data: admins}, status: :ok
    end

    def show
      render json: {status: 'SUCCESS', message: 'Loaded Admin', data: admin}, status: :ok
    end

    def create
      admin = Admin.new admin_params
      if admin.save!
        render json: {status: 'SUCCESS', message: 'Saved Admin', data: admin}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Admin not saved', data: admin.errors}, status: :unprocessable_entity
      end
    end

    def update
      if @admin.update_attributes admin_params
        render json: {status: 'SUCCESS', message: 'Updated Admin', data: @admin}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Admin not Updated', data: admin.errors}, status: :unprocessable_entity
      end
    end

    def destroy
      @admin.destroy
      render json: {status: 'SUCCESS', message: 'Deleted Admin'}, status: :ok
    end

    private
    def set_admin
      @admin = Admin.find params[:id]
    end

    def admin_params
      params.require(:admin).permit(:name, :email, :password)
    end
end
