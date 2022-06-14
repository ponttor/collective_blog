5.times do
  Category.create!(name: Faker::Music.genre)
end

  # Post.create(title: Faker::TvShows::TheITCrowd.character, body: Faker::TvShows::TheITCrowd.quote, user_id: 1 , category_id: 4 )
