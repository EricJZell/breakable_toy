class RemoveCountryIdFromLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :country_id, :integer
  end
end
