class CreatePools < ActiveRecord::Migration[5.1]
  def change
    create_table :pools do |t|
      t.string :name
      t.integer :amount
      t.integer :monthly_amount
      t.integer :seat_number
      t.string :status, :default => "comming"
      t.integer :turn
      t.date :launch_date
      t.date :end_date

      t.timestamps
    end
  end
end
