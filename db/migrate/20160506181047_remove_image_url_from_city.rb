class RemoveImageUrlFromCity < ActiveRecord::Migration
  def change
    remove_column :cities, :image_url, :string
  end
end
