class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :subtitle
      t.string :author
      t.string :genre
      t.date :published_date
      t.string :isbn
      t.text :summary

      t.timestamps
    end
  end
end
