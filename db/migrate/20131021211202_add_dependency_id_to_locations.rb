class AddDependencyIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :dependency_id, :integer
  end
end
