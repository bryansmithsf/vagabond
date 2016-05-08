class PostCity < ActiveRecord::Base
  belongs_to :city
  belongs_to :post
  has_many :posts
  has_many :cities
end
