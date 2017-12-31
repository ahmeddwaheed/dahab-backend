class User < ApplicationRecord

    has_secure_password

    before_save :downcase_email
    before_create :generate_confirmation_instructions

    has_many :requests, dependent: :destroy
    has_many :user_pools
    has_many :pools, through: :user_pools

    validates_presence_of :name, :email

    # validates_presence_of :password

    validates_email_format_of :email

    def downcase_email
        self.email = self.email.delete(' ').downcase
    end
      
    def generate_confirmation_instructions
        self.confirmation_token = SecureRandom.hex(10)
        self.confirmation_sent_at = Time.now.utc
    end

        #### Authentication ####

    def confirmation_token_valid?
        (self.confirmation_sent_at + 30.days) > Time.now.utc
    end
    
    def mark_as_confirmed!
        self.confirmation_token = nil  ### LEEEEH??
        self.confirmed_at = Time.now.utc
        save
    end
      
end
