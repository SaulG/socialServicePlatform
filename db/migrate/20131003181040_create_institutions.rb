class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.integer :name

      t.timestamps
    end
  end
end
