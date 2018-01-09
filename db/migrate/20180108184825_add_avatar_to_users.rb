class AddAvatarToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :avatar, :string, :default => "http://bit.ly/2mhzC6H"
  end
end
