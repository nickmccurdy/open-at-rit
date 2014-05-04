class ChangeTimesToStrings < ActiveRecord::Migration
  def up
    change_column :locations, :weekday_start, :string
    change_column :locations, :weekday_end,   :string
    change_column :locations, :weekend_start, :string
    change_column :locations, :weekend_end,   :string
  end

  def down
    change_column :locations, :weekday_start, :integer
    change_column :locations, :weekday_end,   :integer
    change_column :locations, :weekend_start, :integer
    change_column :locations, :weekend_end,   :integer
  end
end
