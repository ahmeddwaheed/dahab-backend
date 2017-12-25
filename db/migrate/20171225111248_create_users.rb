class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.boolean :in_pool, :default => false
      t.timestamps
    end
  end
end
