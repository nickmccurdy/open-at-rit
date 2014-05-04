class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.time :weekday_start
      t.time :weekday_end
      t.time :weekend_start
      t.time :weekend_end

      t.timestamps
    end
  end
end
