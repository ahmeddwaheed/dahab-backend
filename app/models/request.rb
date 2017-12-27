class Request < ApplicationRecord
    # belongs_to :user
    # belongs_to :pool

    # validates_associated :user, on: :create
    validates_presence_of :background, on: :create
end
