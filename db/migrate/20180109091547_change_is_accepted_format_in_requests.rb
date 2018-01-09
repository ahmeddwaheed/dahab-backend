class ChangeIsAcceptedFormatInRequests < ActiveRecord::Migration[5.1]
  def change
    change_column :requests, :is_accepted, :string , :default => "pending"
  end
end
