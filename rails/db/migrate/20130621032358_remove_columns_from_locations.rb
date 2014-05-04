class RemoveColumnsFromLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :weekday_end, :string
    remove_column :locations, :weekend_end, :string
  end
end
