class AddAvatarToUsersPools < ActiveRecord::Migration[5.1]
  def change
    add_column :user_pools, :avatar, :string
  end
end
