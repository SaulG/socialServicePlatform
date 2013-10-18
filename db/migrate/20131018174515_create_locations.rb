class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.decimal :latitude, :precision => 15, :scale => 10, :default => 0.0
      t.decimal :longitude, :precision => 15, :scale => 10, :default => 0.0
      t.integer :location_id

      t.timestamps
    end
  end
end
