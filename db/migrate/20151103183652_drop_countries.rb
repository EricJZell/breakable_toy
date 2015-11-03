class DropCountries < ActiveRecord::Migration
  def up
    drop_table :countries
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
