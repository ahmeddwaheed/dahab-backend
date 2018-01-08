class Admin < ApplicationRecord

  # has_many :requests
  # has_many :pools

  validates :name, :email, :password, presence: true
  # validates :name, :password, uniqueness: true
  # validates :name, length:{minimum:4, maximum: 40}
  # validates :password, format: {with: /[a-zA-Z0-9]+/}
  # validates :email, format: {with: /^[a-zA-Z][a-zA-Z0-9]*@[a-zA-z0-9]+\.com$/, multiline: true}


end
