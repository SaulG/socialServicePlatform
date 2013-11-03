class RemoveGmapsToDependencies < ActiveRecord::Migration
  def change
      remove_column :dependencies, :gmaps
  end
end
