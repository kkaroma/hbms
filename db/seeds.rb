# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

categories = [ "Fiction", "Non-Fiction", "Mystery", "Biography", "Science Fiction",
          "Fantasy", "Romance", "Thriller", "Self-Help", "History", "Business", "Inspirational" ]

categories.each do |category|
  Category.find_or_create_by(name: category)


admin_email = "admin@karoma.co.tz"
admin_password = "MyAdmin25!"

  # Find or create an admin user
  admin = User.find_or_initialize_by(email: admin_email)
  admin.update!(
    password: admin_password,
    password_confirmation: admin_password,
    admin: true
  )

  puts "Admin user created: #{admin.email}"
end
