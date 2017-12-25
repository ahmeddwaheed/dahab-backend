class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.belongs_to :admin
      t.belongs_to :user
      t.belongs_to :pool
      t.boolean :is_accepted?
      t.text :reason, null: false
      t.string :background, null: false
      t.string :program, null: false
      t.timestamps
    end
  end
end
