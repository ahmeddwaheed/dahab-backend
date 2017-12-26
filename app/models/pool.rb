class Pool < ApplicationRecord
  belongs_to :admin, optional: true
  has_many :requests
  has_many :user_pools
  has_many :users, through: :user_pools


  validates :name, :amount, :monthly_amount, :seat_number, :status, presence: true
  # validates :name, uniqueness: true
  validates :name, length:{minimum:4, maximum: 40}
  # validates :amount, :inclusion => 2000..25000


  
  # scope :ordered_amount, -> {order amount: :asc}
  # scope :starts_with, -> (starting_with){ where ("name LIKE ?", "#{starting_string}%")}

end
