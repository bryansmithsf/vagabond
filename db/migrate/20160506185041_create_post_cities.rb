class CreatePostCities < ActiveRecord::Migration
  def change
    create_table :post_cities do |t|
      t.belongs_to :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
