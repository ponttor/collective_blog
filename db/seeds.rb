# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

8.times do
  Post.create(title: Faker::TvShows::TheITCrowd.character, body: Faker::TvShows::TheITCrowd.quote, user_id: 2 , category_id: 4 )
  # User.create(title: Faker::TvShows::TheITCrowd.character, body: Faker::TvShows::TheITCrowd.quote, user_id: 2 , category_id: 4 )
end
