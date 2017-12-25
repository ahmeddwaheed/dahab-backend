class User < ApplicationRecord

    has_many :requests, dependent: :destroy
    has_many :pools

    validates_presence_of :username

    validates_presence_of :email

    validates :email, uniqueness: true
end
