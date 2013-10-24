class RemoveLocationIdFromDependencies < ActiveRecord::Migration
    def change
        remove_column :dependencies, :location_id
    end
end
