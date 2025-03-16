class WishlistsController < ApplicationController
  before_action :authenticate_user!

  def index
    @wishlist_books = current_user.wishlist_books
  end

  def create
    # book = Book.find(params[:book_id])
    # wishlist_item = current_user.wishlists.new(book: book)

    # if wishlist_item.save
    #   redirect_to books_path, notice: "#{book.title} has been added to your wishlist."
    # else
    #   redirect_to books_path, alert: "This book is already in your wishlist."
    # end


    book = Book.find(params[:book_id])
  wishlist_item = current_user.wishlists.new(book: book)

  if wishlist_item.save
    redirect_to books_path, notice: "#{book.title} has been added to your wishlist."
  else
    redirect_to books_path, alert: "Error: #{wishlist_item.errors.full_messages.join(', ')}"
  end
  end

  def destroy
    wishlist_item = current_user.wishlists.find_by(book_id: params[:id])

    if wishlist_item
      wishlist_item.destroy
      redirect_to wishlists_path, notice: "Book removed from your wishlist."
    else
      redirect_to wishlists_path, alert: "Book not found in your wishlist."
    end
  end
end
