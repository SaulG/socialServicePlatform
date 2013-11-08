class CreateStatusProgresses < ActiveRecord::Migration
  def change
    create_table :status_progresses do |t|
      t.string :name

      t.timestamps
    end
  end
end
