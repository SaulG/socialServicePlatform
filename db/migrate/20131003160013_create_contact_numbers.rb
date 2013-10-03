class CreateContactNumbers < ActiveRecord::Migration
  def change
    create_table :contact_numbers do |t|
      t.integer :user_id
      t.integer :type_of_number_id
      t.string :number

      t.timestamps
    end
  end
end
