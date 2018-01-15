class PaymentNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # When pool is launched
    first_user = args[0]
    users = args[1]
    position = args[2]
    pool= args[3]

    users.each do |user|
      ReminderMailer.payment_notification(user, pool.id).deliver_now
    end

    ReminderMailer.repayment_notification(first_user).deliver_now

    repayment_user = users.shift
    users << first_user

    position += 1

    if pool.number_of_users > pool.turn
      pool.update turn: pool.turn + 1
      PaymentNotificationJob.set(wait: 1.month -3.days).perform_later(repayment_user, users, position, pool.id) unless position > users.length + 1
    end
  end
end
# ReminderMailer.payment_notification(@user).deliver_now
# ReminderMailer.payment_notification(@user).deliver
# month -3.days
