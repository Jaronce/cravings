# $LOAD_PATH << File.join(Rails.root + 'db/photos.rb')
# require_relative 'photos.rb'
require 'faker'

def create_dish(users:, user_name:, user_photo:, user_resto:, user_categoty:)
  dish = Dish.new(name: user_name, price: 2, photo: user_photo)
  dish.restaurant = user_resto
  dish.category = user_category
  dish.save!

  vote_dish = Vote.new(vote: rand(10)*13)
  vote_dish.dish = dish
  users.each do |user|
    vote_dish.user = user
  end

  vote_dish.save!
  return dish
end


create_dish({
  users: user,
  user_name:
  user_photo:
  user_resto:
})

p "Starting seeds... it takes 10000~2000 mins"


p "Adding 1 Users"
User.create!(email: "jay@test.com", username: "pretty_jay", password: "111111", photo: "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png")
users = []
1000.times do
  user << User.create!(email: Faker::Internet.unique.email, username: Faker::Name.unique.name, password: "111111", photo: "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png")
end


p "Adding 3 Categories"
category_1 = Category.create!(name: "Korean") # jekuk bibimbap
category_2 = Category.create!(name: "Japanese") # soyu ramen , salmon sushi, udon, yakitori, tempura
category_3 = Category.create!(name: "Canadian") # poutine, bagle


p "Adding 5 restaurants"
resto_1 = Restaurant.create!(name: "Osaka Ramen", address: "16 Rue Maguire, Montréal, QC H2T 1B8", photo: "https://www.kintonramen.com/canada/img/locations/kinton_logo.jpg")
resto_2 = Restaurant.create!(name: "Petit Seoul", address: "5245 St Laurent Blvd, Montreal, Quebec H2T 1S4", photo: "https://pbs.twimg.com/profile_images/936461490852384769/gVvSjrYT_400x400.jpg")
resto_3 = Restaurant.create!(name: "Sushi Heaven", address: "52 Rue Saint Viateur O, Montréal, QC H2T 2K8", photo: "https://previews.123rf.com/images/butenkow/butenkow1608/butenkow160800750/61573925-sushi-logo-design-template-vector-illustration-of-icon.jpg")
resto_4 = Restaurant.create!(name: "St-Viateur Bagel Shop", address: "5282 Boul St-Laurent, Montréal, QC H2T 1S5", photo: "https://www.stviateurbagel.com/static/images/logo.png")
resto_5 = Restaurant.create!(name: "Poutineville", address: "5445 Gaspe Ave #105, Montreal, Quebec H2T 3B2", photo: "http://www.poutineville.com/gx/poutineVille-logo.svg")


p "Adding Dishes"

dishes = []

1.times do
  dish = Dish.new(name: "tonkotsu ramen", price: 2, photo: "https://www.touristsecrets.com/wp-content/uploads/1019/06/1-Featured-image-Korean-BBQ-by-arjieljosephfg-on-Instagram-1160x653.jpg")
  dish.restaurant = resto_1
  dish.category = category_2
  dish.save!

  vote = Vote.new(vote: 1)
  vote.dish = dish
  users = users.sample(942)

  users.each do |user|
    vote.user = user
  end
  vote.save!
  dishes << dish
end


1.times do
  dish = Dish.new(name: "Jekuk Bibimbap", price: rand(5), photo: "https://www.touristsecrets.com/wp-content/uploads/1019/06/1-Featured-image-Korean-BBQ-by-arjieljosephfg-on-Instagram-1160x653.jpg")
  dish.restaurant = resto_2
  dish.category = category_1
  dish.save!

  vote = Vote.new(vote: 1)
  vote.dish = dish
  users = users.sample(863)

  users.each do |user|
    vote.user = user
  end
  vote.save!
  dishes << dish
end


7.times do
  dish = Dish.new(name: Faker::Food.ingredient + " Ramen", price: rand(5), photo: "https://www.touristsecrets.com/wp-content/uploads/1019/06/1-Featured-image-Korean-BBQ-by-arjieljosephfg-on-Instagram-1160x653.jpg")
  dish.restaurant = resto_1
  dish.category = category_2
  dish.save!

  vote = Vote.new(vote: 1)
  vote.dish = dish
  users = users.sample(rand(60)*14)

  users.each do |user|
    vote.user = user
  end
  vote.save!
  dishes << dish
end

# korean
7.times do
  dish = Dish.new(name: Faker::Food.ingredient + " Bibimbap", price: rand(5), photo: "https://www.touristsecrets.com/wp-content/uploads/2019/06/1-Featured-image-Korean-BBQ-by-arjieljosephfg-on-Instagram-1160x653.jpg")
  dish.restaurant = resto_2
  dish.category = category_1
  dish.save!

  vote = Vote.new(vote: 1)
  vote.dish = dish
  users = users.sample(rand(60)*14)

  users.each do |user|
    vote.user = user
  end
  vote.save!
  dishes << dish
end

#jananese
5.times do
  dish = Dish.new(name: Faker::Food.ingredient + " Sushi", price: rand(5), photo: "https://loremflickr.com/320/240")
  dish.restaurant = resto_3
  dish.category = category_2
  dish.save!

  vote = Vote.new(vote: 1)
  vote.dish = dish
  users = users.sample(rand(60)*14)

  users.each do |user|
    vote.user = user
  end
  vote.save!
  dishes << dish
end

# canadian
5.times do
  dish = Dish.new(name: Faker::Food.dish, price: rand(5), photo: "https://loremflickr.com/320/240")
  dish.restaurant = resto_4
  dish.category = category_3
  dish.save!

  vote = Vote.new(vote: 1)
  vote.dish = dish
  users = users.sample(rand(60)*14)

  users.each do |user|
    vote.user = user
  end
  vote.save!
  dishes << dish
end

# canadian
5.times do
  dish = Dish.new(name: Faker::Food.dish, price: rand(5), photo: "https://loremflickr.com/320/240")
  dish.restaurant = resto_5
  dish.category = category_3
  dish.save!

  vote = Vote.new(vote: 1)
  vote.dish = dish
  users = users.sample(rand(60)*14)

  users.each do |user|
    vote.user = user
  end
  vote.save!
  dishes << dish
end


p "Creating Reviews/ Review Votes"


reviews = []

# 60 uesrs left reviews on tonkotsu ramen
users.sample(60).each do |user|
  review = Review.new(content: Faker::Restaurant.review)
  review.dish = Dish.where(name: "tonkotsu ramen")
  review.user = user
  review.save!
  reviews << review
end

# Tonkotsu Ramen is Top on the list
review_top = Review.new(content: "This one should be on the top", photo: "https://i.redd.it/c0e87106cgky.jpg")

# 374 people upvoting for Tonkotsu Ramen
user.sample(374).each do |user|
  vote_review = VoteReview.new(vote: 1)
  vote_review.review = review_top
  vote_review.user = user
  vote_review.save!
end

# with 60 reveiews
# each Review got vote randomly

reviews.each do |review|
  users.sample(rand(users.length)).each do |user|
    vote_review = VoteReview.new(vote: 1)
    vote_review.review = review
    vote_review.user = user
    vote_review.save!
  end
end

# 100.times do
#   response = RestClient.get('https://s3-media4.fl.yelpcdn.com/bphoto/FmXn6cYO1Mm03UNO5cbOqw/o.jpg')
#   JSON.parse(response)['photos']
# end

p "Seed done :D Let's check the page"


