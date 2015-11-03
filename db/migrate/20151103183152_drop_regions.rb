class DropRegions < ActiveRecord::Migration
  def up
    drop_table :regions
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
