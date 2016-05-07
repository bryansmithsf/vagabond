class DropPostCitiesTable < ActiveRecord::Migration
  def up
    drop_table :post_cities
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
