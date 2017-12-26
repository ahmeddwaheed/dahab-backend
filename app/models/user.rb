class User < ApplicationRecord

    has_many :requests, dependent: :destroy
    has_many :user_pools
    has_many :pools, through: :user_pools

    validates_presence_of :username

    validates_presence_of :email
    validates_presence_of :password

    validates_email_format_of :email
end
