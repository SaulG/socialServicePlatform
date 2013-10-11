class CreateInstitutionAttendants < ActiveRecord::Migration
  def change
    create_table :institution_attendants do |t|
      t.integer :user_id
      t.integer :institution_id

      t.timestamps
    end
  end
end
