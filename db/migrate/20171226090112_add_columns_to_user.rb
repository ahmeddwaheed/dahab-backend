class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :confirm_add, :string
    # add_column :users, :confirmation_token, :string
  end
end
