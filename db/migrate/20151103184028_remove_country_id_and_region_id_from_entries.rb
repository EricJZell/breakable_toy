class RemoveCountryIdAndRegionIdFromEntries < ActiveRecord::Migration
  def change
    remove_column :entries, :country_id, :integer
    remove_column :entries, :region_id, :integer
  end
end
