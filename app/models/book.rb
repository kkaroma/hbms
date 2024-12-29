class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user
  # has_one_attached :cover
  has_one_attached :cover do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 200, 200 ]
  end
end
