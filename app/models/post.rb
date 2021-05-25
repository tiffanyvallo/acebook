class Post < ApplicationRecord
  has_many_attached :image
  has_many :comments
  has_one :user
end
