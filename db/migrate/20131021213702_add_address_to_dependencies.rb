class AddAddressToDependencies < ActiveRecord::Migration
  def change
    add_column :dependencies, :address, :text
  end
end
