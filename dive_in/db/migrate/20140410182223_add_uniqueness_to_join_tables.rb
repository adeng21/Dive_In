class AddUniquenessToJoinTables < ActiveRecord::Migration
  def change
    add_index :divesite_categories, [:divesite_id, :category_id], unique: true
    add_index :divesite_months,  [:divesite_id, :month_id], unique: true
  end
end
