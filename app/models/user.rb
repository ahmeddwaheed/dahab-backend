class User < ApplicationRecord

    has_secure_password

    mount_uploader :avatar, AvatarUploader

    before_save :downcase_email
    before_create :generate_confirmation_instructions

    has_many :requests, dependent: :destroy
    has_many :user_pools
    has_many :pools, through: :user_pools

    validates :name, :email, presence: true
    validates :password, :password_confirmation, presence: true, on: :create

    validates_email_format_of :email
    validates_uniqueness_of :email

    validates :password, confirmation: true
    validates_confirmation_of :password_confirmation


    def downcase_email
        self.email = self.email.delete(' ').downcase
    end
      
    def generate_confirmation_instructions
        self.confirmation_token = SecureRandom.hex(10)
        self.confirmation_sent_at = Time.now.utc
    end
      
end
