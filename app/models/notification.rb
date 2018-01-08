class Notification < ApplicationRecord

  belongs_to :user
  belongs_to :pool

  validates :pool, :user, :message, presence: true

end
