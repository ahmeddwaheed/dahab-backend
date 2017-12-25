class User < ApplicationRecord

    has_many :requests, dependent: :destroy
    # has_many :pools
    # has_many :requests

    validates_presence_of :username

    validates_presence_of :email
    validates_presence_of :password

    validates_email_format_of :email, :message => 'is not looking good'
end
