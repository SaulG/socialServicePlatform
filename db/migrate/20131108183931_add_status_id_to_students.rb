class AddStatusIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :status_id, :integer
  end
end
