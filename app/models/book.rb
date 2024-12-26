class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_one_attached :cover
end
