class RemoveStatusIdFromStudents < ActiveRecord::Migration
  def up
    remove_column :students, :status_id
  end

  def down
    add_column :students, :status_id, :integer
  end
end
