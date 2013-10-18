class CreateTypeOfAdministrations < ActiveRecord::Migration
  def change
    create_table :type_of_administrations do |t|
      t.string :type

      t.timestamps
    end
  end
end
