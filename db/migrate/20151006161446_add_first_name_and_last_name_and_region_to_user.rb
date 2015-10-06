class AddFirstNameAndLastNameAndRegionToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :region, :string
    add_column :users, :user_name, :string, null: false
  end

end
