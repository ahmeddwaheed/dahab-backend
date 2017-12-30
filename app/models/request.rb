class Request < ApplicationRecord
    belongs_to :user
    belongs_to :pool
    belongs_to :admin

    # validates_associated :user, on: :create
    validates_presence_of :background, on: :create
end
