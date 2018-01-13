class AddUserNameToRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :user_name , :string
  end
end
