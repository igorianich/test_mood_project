# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user1 = User.create!(email: 'user1@example.com', password: 'password', first_name: 'User', last_name: 'One', phone: '1234567890')
user2 = User.create!(email: 'user2@example.com', password: 'password', first_name: 'User', last_name: 'Two', phone: '1234567891')

manager1 = User.create!(email: 'manager1@example.com', password: 'password', first_name: 'Manager', last_name: 'One', phone: '1234567892')
manager2 = User.create!(email: 'manager2@example.com', password: 'password', first_name: 'Manager', last_name: 'Two', phone: '1234567893')

admin = User.create!(email: 'admin@example.com', password: 'password', first_name: 'Admin', last_name: 'User', phone: '1234567894')

user1.add_role :user
user2.add_role :user
manager1.add_role :manager
manager2.add_role :manager
admin.add_role :admin