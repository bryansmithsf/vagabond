class AddPostToCity < ActiveRecord::Migration
  def change
    add_reference :cities, :post, index: true, foreign_key: true
  end
end
