json.extract! book, :id, :title, :subtitle, :author, :genre, :published_date, :isbn, :summary, :created_at, :updated_at
json.url book_url(book, format: :json)
