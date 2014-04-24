class CreateDivesiteMonths < ActiveRecord::Migration
  def change
    create_table :divesite_months do |t|
      t.integer :month_id, null: false
      t.integer :divesite_id, null: false

      t.timestamps
    end
  end
end
