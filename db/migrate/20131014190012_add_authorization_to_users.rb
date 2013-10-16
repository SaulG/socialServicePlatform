class AddAuthorizationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :authorization, :string
  end
end
