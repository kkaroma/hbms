class WishlistsController < ApplicationController
  class WishlistsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_wishlist, only: [ :destroy, :move_to_books ]

    # def index
    #  @wishlisted_books = current_user.wishlists.includes(:book)
    # end

    def index
      @wishlisted_books = current_user.wishlisted_books
    end

    def create
      @book = Book.find(params[:book_id])
      @wishlist = current_user.wishlists.build(book: @book)

      if @wishlist.save
        redirect_to books_path, notice: "Book added to your wishlist."
      else
        redirect_to books_path, alert: "This book is already in your wishlist."
      end
    end

    def destroy
      @wishlist.destroy
      redirect_to wishlists_path, notice: "Book removed from wishlist."
    end

    def move_to_books
      @book = @wishlist.book

      # Transfer the book to the user's collection
      if @book.update(user: current_user)
        @wishlist.destroy
        redirect_to books_path(my_books: true), notice: "Book moved to your collection."
      else
        redirect_to wishlists_path, alert: "Failed to move the book."
      end
    end

    private

    def set_wishlist
      @wishlist = current_user.wishlists.find(params[:id])
    end
  end
end
