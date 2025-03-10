class WishlistsController < ApplicationController
  before_action :authenticate_user!

  def index
    @wishlisted_books = current_user.wishlists.includes(:book)
  end

  def create
    book = Book.find(params[:book_id])

    if current_user.wishlists.exists?(book: book)
      redirect_back fallback_location: books_path, alert: "Book is already in your Wishlist."
    else
      wishlist = current_user.wishlists.build(book: book)
      if wishlist.save
        redirect_back fallback_location: books_path, notice: "Book added to Wishlist."
      else
        redirect_back fallback_location: books_path, alert: "Could not add to Wishlist."
      end
    end
  end

  def destroy
    wishlist = current_user.wishlists.find_by(id: params[:id])

    if wishlist
      wishlist.destroy
      redirect_back fallback_location: books_path, notice: "Removed from Wishlist."
    else
      redirect_back fallback_location: books_path, alert: "Wishlist entry not found."
    end
  end

  def move_to_books
    wishlist_entry = current_user.wishlists.find(params[:id])

    if wishlist_entry
      book = wishlist_entry.book
      wishlist_entry.destroy  # Remove from Wishlist
      # Here you can add logic to assign ownership (if needed)

      redirect_back fallback_location: books_path, notice: "#{book.title} moved to your books."
    else
      redirect_back fallback_location: books_path, alert: "Could not move book."
    end
  end
end
