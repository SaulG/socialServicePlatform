class AddIndexToInstitutionsName < ActiveRecord::Migration
  def change
      add_index :institutions, :name, unique: true
  end
end
