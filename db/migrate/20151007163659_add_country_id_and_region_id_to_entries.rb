class AddCountryIdAndRegionIdToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :country_id, :integer, null: false
    add_column :entries, :region_id, :integer, null: false
  end
end
