class NumberOfUsersToPools < ActiveRecord::Migration[5.1]
  def change
    add_column :pools, :number_of_users, :integer
  end
end
