class Removenotnullconstraintfromuserid < ActiveRecord::Migration
  def up
    remove_column :reviews, :user_id, :integer, null: false
    add_column :reviews, :user_id, :integer
  end

  def down
    remove_column :reviews, :user_id, :integer
    add_column :reviews, :user_id, :integer, null: :false
  end
end
