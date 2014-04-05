class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.float :rating, null: false
      t.date :date, null: false
      t.integer :user_id, null: false
      t.integer :divesite_id, null: false

      t.timestamps
    end
    add_index :reviews, :user_id
    add_index :reviews, :divesite_id
  end
end
