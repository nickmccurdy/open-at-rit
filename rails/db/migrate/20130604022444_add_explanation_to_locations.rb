class AddExplanationToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :explanation, :string
  end
end
