class AddPostToPostCities < ActiveRecord::Migration
  def change
    add_reference :post_cities, :post, index: true, foreign_key: true
  end
end
