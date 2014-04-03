class CreateDivesites < ActiveRecord::Migration
  def change
    create_table :divesites do |t|
      t.string :name, null: false
      t.string :region
      t.string :country, null: false
      t.text :description, null: false
      t.text :surrounding_area
      t.integer :rating, null: false
      t.string :water_temperature
      t.string :visibility

      t.timestamps
    end
  end
end
