class RemoveConstraintFromMedia < ActiveRecord::Migration
  def up
    change_column :media, :divesite_id, :integer, null: true
  end

  def down
    change_column :media, :divesite_id, :integer, null: false
  end
end
