class CreateDependencies < ActiveRecord::Migration
  def change
    create_table :dependencies do |t|
      t.string :name
      t.integer :type_of_administration_id
      t.integer :location_id

      t.timestamps
    end
  end
end
