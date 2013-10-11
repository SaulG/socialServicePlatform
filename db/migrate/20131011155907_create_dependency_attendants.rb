class CreateDependencyAttendants < ActiveRecord::Migration
  def change
    create_table :dependency_attendants do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
