class CreateSwellModels < ActiveRecord::Migration
  def change
    create_table :swell_models do |t|
      t.json :swell_data
      t.integer :entry_id, null: false
    end
  end
end
