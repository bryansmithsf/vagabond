class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :city, dependent: :destroy
  validates :title, length: { minimum: 1 }
  validates :title, length: { maximum: 200 }
  validates :text, length: { minimum: 1 }
end
