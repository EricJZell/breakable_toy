class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :requestor_id, null: false
      t.integer :requestee_id, null: false
      t.boolean :accepted, null: false, default: false
    end
  end
end
