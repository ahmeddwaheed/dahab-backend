class Admin < ApplicationRecord

  has_secure_password

  validates :name, :email, :password, presence: true

  validates_email_format_of :email
  validates :email, uniqueness: true

end
