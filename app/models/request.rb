class Request < ApplicationRecord
    belongs_to :user
    belongs_to :pool
    # belongs_to :admin
    # validates_associated :user, on: :create
    validates_presence_of :background, on: :create

    # before_save :check_is_accepted_and_notify


    def notify message
      notification = Notification.create message: message, pool_id: self.pool_id, user_id: self.user_id
    end

    # def reject
    #     if self.is_accepted_changed?
    #       self.notify  "sorry your request is rejected!" if self.is_accepted_was == "pending" && self.is_accepted == "rejected"
    #     end
    # end
    #
    # def accept
    #     if self.is_accepted_changed?
    #       self.notify  "congrats your request is accepted!" if self.is_accepted_was == "pending" && self.is_accepted == "accepted"
    #     end
    # end

    def accept
      if self.update :is_accepted, 'accepted'
        Notification.create message: "congrats your request is accepted!", pool_id: self.pool_id, user_id: self.user_id
      end
    end

    def reject
      if self.update :is_accepted, 'rejected'
        Notification.create message: "Your request is rejected!", pool_id: self.pool_id, user_id: self.user_id
      end
    end



      # def accept
      #     if self.is_accepted_changed?
      #       self.notify if self.is_accepted_was == "pending" && self.is_accepted == "rejected"
      # end
      #
      # def notify
      #   notification = Notification.create , pool_id: self.pool_id, user_id: self.user_id
      # end
      #
      # def accept
      #     if self.is_accepted_changed?
      #       self.notify if self.is_accepted_was == "pending" && self.is_accepted == "accepted"
      # end
      #

      # private
      # def check_is_accepted_and_notify
      #   if self.is_accepted_changed?
      #     if self.is_accepted == 'accepted'
      #       self.notify
      #     else
      #     end
      #   end
      # end
      #
      # def notify
      #   notification = Notification.create message: "congrats your request is accepted!", pool_id: self.pool_id, user_id: self.user_id
      # end

      # private
      # def check_is_accepted_and_notify
      #   if self.is_accepted_changed?
      #     Notification.create!() if self.status_was == false && self.status == true
      #   end
      # end

end
