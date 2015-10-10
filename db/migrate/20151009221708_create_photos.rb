class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :entry_id, null: false
      t.string :file_name, null: false
    end
  end
end
