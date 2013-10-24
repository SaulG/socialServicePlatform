class CreateAptitudes < ActiveRecord::Migration
  def change
    create_table :aptitudes do |t|
      t.string :name

      t.timestamps
    end
  end
end
