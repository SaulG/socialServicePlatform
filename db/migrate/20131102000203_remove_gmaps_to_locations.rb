class RemoveGmapsToLocations < ActiveRecord::Migration
  def change
      remove_column :locations, :gmaps
  end
end
