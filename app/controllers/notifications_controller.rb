class NotificationsController < ApplicationController
  before_action :authenticate_request!
  def index
    @notifications = current_user.notifications.order('created_at DESC');
    render json: {status: 'SUCCESS', message: 'Loaded Notifications', data: @notifications}, status: :ok
  end
end
