class AddDescriptionAndLatAndLonAndMswUrlToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :description, :string
    add_column :locations, :lat, :float, null: false
    add_column :locations, :lon, :float, null: false
    add_column :locations, :msw_url, :string, null: false
  end
end
