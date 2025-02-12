class HomeController < ApplicationController
  def index
      # @books = Book.order("id DESC")

      @books = Book.all.order("id DESC").limit(4)

    # @books = @book.order("id DESC")
  end
end
