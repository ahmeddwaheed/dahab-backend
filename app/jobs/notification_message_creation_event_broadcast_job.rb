class NotificationMessageCreationEventBroadcastJob < ApplicationJob
  queue_as :default

  def perform(notification_message)
    ActionCable
      .server
      .broadcast('notification_channel',{
                 id: notification_message.id,
                 created_at: notification_message.created_at.strftime('%H:%M'),
                 message: notification_message.message
               }.to_json)
  end
end
