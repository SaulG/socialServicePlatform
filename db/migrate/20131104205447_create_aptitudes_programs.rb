class CreateAptitudesPrograms < ActiveRecord::Migration
    def up
        create_table :aptitudes_programs, :id => false do |t|
            t.integer :aptitude_id, :null => false
            t.integer :program_id, :null => false
        end
        add_index :aptitudes_programs, [:aptitude_id, :program_id], :unique => true
    end
    def down
        remove_index :aptitudes_programs, :column => [:aptitude_id, :program_id]
        drop_table :aptitudes_programs
    end
end
