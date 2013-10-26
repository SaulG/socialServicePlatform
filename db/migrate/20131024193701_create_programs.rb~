class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.text :description
      t.integer :quantity_of_students
      t.integer :turn_id
      t.integer :dependency_id
      t.integer :dependency_attendant_id

      t.timestamps
    end
  end
end
