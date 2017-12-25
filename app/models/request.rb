class Request < ApplicationRecord
  belongs_to :pool
  belongs_to :user
  belongs_to :admin


  validates :pool, :user, :reason, :background, :program, presence: true
  validates :reason, length: { maximum: 500 }
end
