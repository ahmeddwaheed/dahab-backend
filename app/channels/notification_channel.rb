class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'notification_channel'
  end

  def unsubscribed
    stop_all_streams

  end

  def create(opts)
    NotificationMessage.create(
      content: opts.fetch('content')
    )
  end
end
