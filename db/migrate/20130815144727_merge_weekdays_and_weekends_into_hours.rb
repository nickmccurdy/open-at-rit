class MergeWeekdaysAndWeekendsIntoHours < ActiveRecord::Migration
  def change
    remove_column :locations, :weekdays, :string
    remove_column :locations, :weekends, :string
    add_column    :locations, :hours,    :string
  end
end
