class AddUniquenessIndexToMonths < ActiveRecord::Migration
  def change
    add_index :months, :name, unique: true
  end
end
