class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.boolean :is_accepted, :default => false
      t.belongs_to :user
      t.belongs_to :pool
      t.text :reason
      t.text :background
      t.string :program
      t.timestamps
    end
  end
end
