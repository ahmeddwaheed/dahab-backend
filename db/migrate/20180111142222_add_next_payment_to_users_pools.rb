class AddNextPaymentToUsersPools < ActiveRecord::Migration[5.1]
  def change
    add_column :user_pools, :next_payment , :date
  end
end
