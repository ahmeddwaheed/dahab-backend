class Pool < ApplicationRecord
  belongs_to :admin, optional: true
  # has_many :requests, dependent: :destroy
  # has_many :users, through: :users_pools


  validates :name, :amount, :monthly_amount, :seat_number, :status, presence: true
  validates :name, uniqueness: true
  validates :name, length:{minimum:4, maximum: 40}
  validates :amount, length:{minimum: 2000, maximum: 25000}

end
