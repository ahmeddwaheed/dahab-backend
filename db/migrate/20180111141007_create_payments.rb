class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.belongs_to :user
      t.belongs_to :pool
      t.integer :amount
      t.integer :turn, :default => 0
      t.timestamps
    end
  end
end
