class AddLatitudeAndLongitudeToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :latitude, :float
    add_column :entries, :longitude, :float
  end
end
