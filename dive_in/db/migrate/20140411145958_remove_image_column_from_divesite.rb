class RemoveImageColumnFromDivesite < ActiveRecord::Migration
  def up
  remove_column :divesites, :image
  end

  def down
  add_column :divesites, :image, :string
  end
end
