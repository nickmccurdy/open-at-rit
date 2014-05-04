class ChangeTimesToIntegers < ActiveRecord::Migration
  def up
    change_column :locations, :weekday_start, :integer
    change_column :locations, :weekday_end,   :integer
    change_column :locations, :weekend_start, :integer
    change_column :locations, :weekend_end,   :integer
  end

  def down
    change_column :locations, :weekday_start, :time
    change_column :locations, :weekday_end,   :time
    change_column :locations, :weekend_start, :time
    change_column :locations, :weekend_end,   :time
  end
end
