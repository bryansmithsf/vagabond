class AddCityToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :city, index: true, foreign_key: true
  end
end
