require 'open-uri'
require 'json'


puts "db is being washed out before rearmement"
Movie.destroy_all

# Make a GET request to the API endpoint
response = URI.open('http://tmdb.lewagon.com/movie/top_rated').read

# Parse the JSON response
movies_data = JSON.parse(response)

# Loop through the movies data and create Movie records
movies_data['results'].each do |movie_data|
  Movie.create(
    title: movie_data['title'],
    overview: movie_data['overview'],
    poster_url: "http://image.tmdb.org/t/p/original#{movie_data['poster_path']}",
    rating: movie_data['vote_average']
  )
end

puts "#{Movie.count} movies in database"
puts "Finished!"



# puts "db is being washed out before rearmement"
# Movie.destroy_all

# puts "Creating the db ..."

# Movie.create!(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create!(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create!(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create!(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

# # Create movies using Faker data
# 4.times do
#   Movie.create!(
#     title: Faker::Movie.title,
#     overview: Faker::Movie.quote,
#     # poster_url: Faker::LoremFlickr.image(size: "300x450", is_gray: false),
#     rating: Faker::Number.between(from: 1.0, to: 10.0)
#   )
# end

# puts "#{Movie.count} movies in database"
# puts "Finished!"
