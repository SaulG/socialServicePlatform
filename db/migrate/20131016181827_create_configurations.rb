class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.integer :user_id
      t.integer :frequency_id
      t.boolean :notification_in_real_time
      t.boolean :can_send_email

      t.timestamps
    end
  end
end
