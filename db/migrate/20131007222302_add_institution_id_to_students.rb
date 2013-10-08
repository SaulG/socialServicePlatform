class AddInstitutionIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :institution_id, :integer
  end
end
