class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  has_many :post_cities
end
