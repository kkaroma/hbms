json.extract! review, :id, :title, :content, :rating, :book_id, :user_id, :created_at, :updated_at
json.url review_url(review, format: :json)
