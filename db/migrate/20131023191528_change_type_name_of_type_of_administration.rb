class ChangeTypeNameOfTypeOfAdministration < ActiveRecord::Migration
  def change
      rename_column :type_of_administrations, :type, :name
  end
end
