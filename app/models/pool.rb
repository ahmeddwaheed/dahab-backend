class Pool < ApplicationRecord
  # belongs_to :admin, optional: true
  has_many :requests
  has_many :user_pools
  has_many :users, -> { order('user_pools.position') }, through: :user_pools

  before_save :check_status_and_launch


  validates :name, :amount, :monthly_amount, :seat_number, :status, presence: true
  validates :name, length:{minimum:4, maximum: 40}
  # validates :amount, :inclusion => 2000..25000

  # scope :ordered_amount, -> {order amount: :asc}
  # scope :starts_with, -> (starting_with){ where ("name LIKE ?", "#{starting_string}%")}


  def launch
    users = self.users.entries
    first_user = users.shift
    PaymentNotificationJob.set(wait: 1.second).perform_later(first_user, users, 1, self)
  end

  private
  def check_status_and_launch
    if self.status_changed?
      self.launch if self.status_was == 'comming' && self.status == 'running'
    end
  end
end
