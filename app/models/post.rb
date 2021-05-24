class Post < ApplicationRecord
  has_one_attached :photo1
  has_one_attached :photo2
  has_one_attached :photo3
  has_one_attached :photo4
  has_one :user
end
