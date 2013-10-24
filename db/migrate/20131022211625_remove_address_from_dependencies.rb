class RemoveAddressFromDependencies < ActiveRecord::Migration
  def up
    remove_column :dependencies, :address
  end

  def down
    add_column :dependencies, :address, :text
  end
end
