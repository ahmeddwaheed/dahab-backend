class CreateUserPools < ActiveRecord::Migration[5.1]
  def change
    create_table :user_pools do |t|
      t.belongs_to :user
      t.belongs_to :pool
      t.integer :position
      t.string :name
      t.timestamps
    end
  end
end
