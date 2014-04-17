class AddImagesToCategories < ActiveRecord::Migration
  def change
    add_column :media, :category_id, :integer, index: true
  end
end
