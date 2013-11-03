class AddGmapsToDependencies < ActiveRecord::Migration
  def change
    add_column :dependencies, :gmaps, :boolean
  end
end
