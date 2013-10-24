class CreateProgramAptitude < ActiveRecord::Migration
    def up
        create_table :programs_aptitudes, :id => false do |t|
            t.integer :program_id, :null => false
            t.integer :aptitude_id, :null => false
        end
        #Agregando indices en las ids y evitar que se replican las relaciones con las id's
        add_index :programs_aptitudes, [:program_id, :aptitude_id], :unique => true
    end
    def down
        remove_index :programs_aptitudes, :column => [:program_id, :aptitude_id]
        drop_table :programs_aptitudes
    end
end
