class Notification < ApplicationRecord

  belongs_to :user
  belongs_to :pool

  validates :pool, :user, :message, presence: true


  after_create_commit do
    NotificationMessageCreationEventBroadcastJob.perform_later(self)
  end

end
#
# belongs_to :admin, optional: true
# has_many :requests
# has_many :user_pools
# has_many :users, -> { order('user_pools.position') }, through: :user_pools
#
# PaymentNotificationJob.set(wait: 1.second).perform_later(first_user, users, 1)

#
#
