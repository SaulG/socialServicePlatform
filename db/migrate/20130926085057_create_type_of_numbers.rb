class CreateTypeOfNumbers < ActiveRecord::Migration
  def change
    create_table :type_of_numbers do |t|
      t.string :type_of_number

      t.timestamps
    end
  end
end
