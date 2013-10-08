class ChangeIntegerToStringNameOfInstitutions < ActiveRecord::Migration
  def up
      change_column :institutions, :name, :string
  end

  def down
      change_column :institutions, :name, :integer
  end
end
