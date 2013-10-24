class CreateDependencyAddresses < ActiveRecord::Migration
  def change
    create_table :dependency_addresses do |t|
      t.integer :dependency_id
      t.string :street
      t.string :number
      t.string :colony
      t.string :postalcode
      t.string :city

      t.timestamps
    end
  end
end
