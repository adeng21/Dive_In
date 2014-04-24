class CreateDivesiteCategories < ActiveRecord::Migration
  def change
    create_table :divesite_categories do |t|
      t.integer :divesite_id, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
