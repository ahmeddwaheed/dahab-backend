class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|


      t.string :message
      t.belongs_to :user
      t.belongs_to :pool

      t.timestamps
    end
  end
end
