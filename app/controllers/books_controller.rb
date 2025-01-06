class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  # before_action :authenticate_admin!, only: [ :edit, :update ]
  before_action :authorize_user!, only: [ :new, :edit, :update, :destroy ]

  # GET /books or /books.json
  def index
    @books = Book.order("id DESC")
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = current_user.books.build(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy!

    respond_to do |format|
      format.html { redirect_to books_path, status: :see_other, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params.expect(:id))
    end

    def authorize_user!
      unless @book.user == current_user
        redirect_to books_path, alert: "You are not authorized to perform this action."
      end
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.expect(book: [ :title, :subtitle, :author, :genre, :published_date, :isbn, :category_id, :cover, :summary ])
    end
  protected
  def authenticate_admin!
    authenticate_user!
    redirect_to root_path, status: :forbidden unless current_user.admin?
  end
end
