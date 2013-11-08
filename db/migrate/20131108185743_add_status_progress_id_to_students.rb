class AddStatusProgressIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :status_progress_id, :integer
  end
end
