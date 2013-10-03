class CreateHerarchyOfInstitutions < ActiveRecord::Migration
  def change
    create_table :herarchy_of_institutions do |t|
      t.integer :institution_id
      t.integer :subinstitution_id

      t.timestamps
    end
  end
end
