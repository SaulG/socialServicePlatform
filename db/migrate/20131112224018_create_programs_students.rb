class CreateProgramsStudents < ActiveRecord::Migration
  def up
      create_table :programs_students, :id => false do | t |
          t.integer :program_id, :null => false
          t.integer :student_id, :null => false
      end
      add_index :programs_students, [:program_id, :student_id], :unique => true
  end

  def down
      remove_index :programs_students, :column => [:program_id, :student_id]
      drop_table :programs_students
  end
end
