class Wishlist < ApplicationRecord
  belongs_to :user
  belongs_to :book

  # validates :book_id, uniqueness: { scope: :user_id, message: "is already in your wishlist" }
  validates :user_id, uniqueness: { scope: :book_id, message: "has already wishlisted this book" }
end

belongs_to :user
  belongs_to :book
