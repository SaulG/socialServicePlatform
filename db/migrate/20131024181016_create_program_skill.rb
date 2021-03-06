class CreateProgramSkill < ActiveRecord::Migration
    def up
        create_table :programs_skills, :id => false do |t|
            t.integer :program_id, :null => false
            t.integer :skill_id, :null => false
        end
        #Agregando indices en las ids y evitar que se replican las relaciones con las id's
        add_index :programs_skills, [:program_id, :skill_id], :unique => true
    end
    def down
        remove_index :programs_skills, :column => [:program_id, :skill_id]
        drop_table :programs_skills
    end
end
