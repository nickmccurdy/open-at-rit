class RenameExplanationToDescription < ActiveRecord::Migration
  def change
    rename_column :locations, :explanation, :description
  end
end
