class ChangeTypeNameOfFrequencies < ActiveRecord::Migration
    def change
        rename_column :frequencies, :type, :name
    end
end
