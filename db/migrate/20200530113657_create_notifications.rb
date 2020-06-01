class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :notification_type, unique: true, index: true
      t.string :text
      t.timestamps
    end
  end
end
