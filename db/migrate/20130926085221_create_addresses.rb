class CreateAddresses < ActiveRecord::Migration
    def change
        create_table :addresses do |t|
            t.integer :user_id
            t.text :description
            t.timestamps
        end
        add_index :addresses, [:user_id]
    end
end
