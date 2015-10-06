class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.integer :country_id, null: false
      t.integer :msw_id, null: false
    end
  end
end
