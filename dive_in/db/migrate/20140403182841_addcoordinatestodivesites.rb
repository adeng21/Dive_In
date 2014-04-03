class Addcoordinatestodivesites < ActiveRecord::Migration
  def change
    add_column :divesites, :latitude, :float, null: false
    add_column :divesites, :longitude, :float, null:false
  end
end
