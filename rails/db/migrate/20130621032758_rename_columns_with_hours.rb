class RenameColumnsWithHours < ActiveRecord::Migration
  def change
    rename_column :locations, :weekday_start, :weekdays
    rename_column :locations, :weekend_start, :weekends
  end
end
