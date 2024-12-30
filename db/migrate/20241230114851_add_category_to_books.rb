class AddCategoryToBooks < ActiveRecord::Migration[8.0]
  def change
    def change
      # Add the genre_id column and allow null temporarily
      add_reference :books, :category, foreign_key: true

      # Assign a default genre to existing books
      default_category = Category.find_or_create_by(name: "Uncategorized")
      Book.update_all(category_id: default_category.id)

      # Change the column to not allow null values
      change_column_null :books, :category_id, false
    end
  end
end
