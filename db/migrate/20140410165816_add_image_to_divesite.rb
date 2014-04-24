class AddImageToDivesite < ActiveRecord::Migration
  def change
    add_column :divesites, :image, :string
  end
end
