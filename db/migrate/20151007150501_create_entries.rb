class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :user_id, null: false
      t.integer :location_id, null: false
      t.integer :swell_model_id
      t.string :title, null: false
      t.text :body
      t.integer :rating
      t.date :date, null: false

      t.timestamps
    end
  end
end
