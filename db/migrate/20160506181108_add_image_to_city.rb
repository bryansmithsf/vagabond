class AddImageToCity < ActiveRecord::Migration
  def change
    add_column :cities, :image, :string
  end
end
