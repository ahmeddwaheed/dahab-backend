class UserPool < ApplicationRecord
    belongs_to :user
    belongs_to :pool
    validates :pool, :user, presence: true
end
