class NotificationsController < ApplicationController

  def index
    notifications = Notification.order('created_at DESC');
    render json: {status: 'SUCCESS', message: 'Loaded Notifications', data: notifications}, status: :ok
  end

  def create
    notification = Notification.new notification_params
    if notification.save!
      render json: {status: 'SUCCESS', message: 'Saved Notification', data: notification}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Notification not saved', data: notification.errors}, status: :unprocessable_entity
    end
  end

end
