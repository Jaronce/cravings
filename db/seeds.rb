# $LOAD_PATH << File.join(Rails.root + 'db/fake_data.rb')
# require_relative 'fake_data.rb'
require 'faker'

p "Destroy previous data"
Restaurant.destroy_all
Category.destroy_all
Dish.destroy_all
Review.destroy_all
VoteReview.destroy_all
ActiveRecord::Base.connection.execute("delete from users")


p "Adding 1000 Users"
user_jay = User.create!(email: "jay@test.com", username: "pretty_jay", password: "111111", photo: "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png")
users_array = Array.new(1_000) { [Faker::Internet.unique.email, Faker::Name.unique.name.gsub("'", "\"")] }
values = users_array.map { |user| "(" + user.map { |s| "'#{s}'" }.join(", ") + ", '2019-11-27', '2019-11-27'" + ")" }.join(", ")
query = "INSERT INTO users (email, username, created_at, updated_at) VALUES #{values}"
ActiveRecord::Base.connection.execute(query)
users = []
User.all.each { |user| users << user}
# p users


p "Adding 3 Categories"
category_korean = Category.create!(name: "Korean") # jekuk bibimbap
category_japanese = Category.create!(name: "Japanese") # soyu ramen , salmon sushi, udon, yakitori, tempura
category_canadian = Category.create!(name: "Canadian") # poutine, bagle


p "Adding 5 restaurants"
resto_ramen = Restaurant.create!(name: "Osaka Ramen", address: "16 Rue Maguire, Montréal, QC H2T 1B8", photo: "https://www.kintonramen.com/canada/img/locations/kinton_logo.jpg")
resto_korean = Restaurant.create!(name: "Petit Seoul", address: "5245 St Laurent Blvd, Montreal, Quebec H2T 1S4", photo: "https://pbs.twimg.com/profile_images/936461490852384769/gVvSjrYT_400x400.jpg")
resto_sushi = Restaurant.create!(name: "Sushi Heaven", address: "52 Rue Saint Viateur O, Montréal, QC H2T 2K8", photo: "https://previews.123rf.com/images/butenkow/butenkow1608/butenkow160800750/61573925-sushi-logo-design-template-vector-illustration-of-icon.jpg")
resto_bagle = Restaurant.create!(name: "St-Viateur Bagel Shop", address: "5282 Boul St-Laurent, Montréal, QC H2T 1S5", photo: "https://www.stviateurbagel.com/static/images/logo.png")
resto_poutine = Restaurant.create!(name: "Poutineville", address: "5445 Gaspe Ave #105, Montreal, Quebec H2T 3B2", photo: "http://www.poutineville.com/gx/poutineVille-logo.svg")



p "Adding Dishes"

# @dish = Dish.new(name: "tonkotsu ramen", price: 2, photo: "https://www.touristsecrets.com/wp-content/uploads/1019/06/1-Featured-image-Korean-BBQ-by-arjieljosephfg-on-Instagram-1160x653.jpg")
# @dish = @dish.new_dish(resto_ramen, category_japanese)
# users.new_user(rand(600..900), @dish)




dish = Dish.new(name: "tonkotsu ramen", price: 2, photo: "https://www.touristsecrets.com/wp-content/uploads/1019/06/1-Featured-image-Korean-BBQ-by-arjieljosephfg-on-Instagram-1160x653.jpg")
dish.restaurant = resto_ramen
dish.category = category_japanese
dish.save!

users = users.sample(rand(600..900))
users.each do |user|
  vote = Vote.new(vote: 1)
  vote.user = user
  vote.dish = dish
  vote.save!
end


dish = Dish.new(name: "Jekuk Bibimbap", price: rand(1..5), photo: "https://www.touristsecrets.com/wp-content/uploads/1019/06/1-Featured-image-Korean-BBQ-by-arjieljosephfg-on-Instagram-1160x653.jpg")
dish.restaurant = resto_korean
dish.category = category_korean
dish.save!

users = users.sample(rand(500..700))
users.each do |user|
  vote = Vote.new(vote: 1)
  vote.user = user
  vote.dish = dish
  vote.save!
end


(1..7).to_a.each do
  dish = Dish.new(name: Faker::Food.ingredient + " Ramen", price: rand(1..5), photo: "https://www.touristsecrets.com/wp-content/uploads/1019/06/1-Featured-image-Korean-BBQ-by-arjieljosephfg-on-Instagram-1160x653.jpg")
  dish.restaurant = resto_ramen
  dish.category = category_japanese
  dish.save!

  users = users.sample(rand(50..400))
  users.each do |user|
    vote = Vote.new(vote: 1)
    vote.user = user
    vote.dish = dish
    vote.save!
  end
end

# korean
(1..7).to_a.each do
  dish = Dish.new(name: Faker::Food.ingredient + " Bibimbap", price: rand(1..5), photo: "https://www.touristsecrets.com/wp-content/uploads/2019/06/1-Featured-image-Korean-BBQ-by-arjieljosephfg-on-Instagram-1160x653.jpg")
  dish.restaurant = resto_korean
  dish.category = category_korean
  dish.save!

  users = users.sample(rand(50..400))
  users.each do |user|
    vote = Vote.new(vote: 1)
    vote.user = user
    vote.dish = dish
    vote.save!
  end
end

#jananese
(1..5).to_a.each do
  dish = Dish.new(name: Faker::Food.ingredient + " Sushi", price: rand(1..5), photo: "https://loremflickr.com/320/240")
  dish.restaurant = resto_sushi
  dish.category = category_japanese
  dish.save!

  users = users.sample(rand(50..400))
  users.each do |user|
    vote = Vote.new(vote: 1)
    vote.user = user
    vote.dish = dish
    vote.save!
  end
end

# canadian
(1..5).to_a.each do
  dish = Dish.new(name: Faker::Food.dish, price: rand(1..5), photo: "https://loremflickr.com/320/240")
  dish.restaurant = resto_bagle
  dish.category = category_canadian
  dish.save!

  users = users.sample(rand(50..400))
  users.each do |user|
    vote = Vote.new(vote: 1)
    vote.user = user
    vote.dish = dish
    vote.save!
  end
end

# canadian
(1..5).to_a.each do
  dish = Dish.new(name: Faker::Food.dish, price: rand(1..5), photo: "https://loremflickr.com/320/240")
  dish.restaurant = resto_poutine
  dish.category = category_canadian
  dish.save!

  users = users.sample(rand(50..400))
  users.each do |user|
    vote = Vote.new(vote: 1)
    vote.user = user
    vote.dish = dish
    vote.save!
  end
end


p "Creating Reviews/ Review Votes"


reviews = []

# Creating Top Review of Ramen - TBU
review_top = Review.new(content: "This one should be on the top", photo: "https://i.redd.it/c0e87106cgky.jpg")
review_top.dish = Dish.where(name: "tonkotsu ramen").first
review_top.user = user_jay
review_top.save!


# 100~200 people upvoting for Top Review
users.sample(rand(100..200)).each do |user|
  vote_review = VoteReview.new(vote: 1)
  vote_review.review = review_top
  vote_review.user = user
  vote_review.save!
end


# 20~40 uesrs left reviews on tonkotsu ramen
users.sample(rand(20..40)).each do |user|
  review = Review.new(content: Faker::Restaurant.review)
  review.dish = Dish.where(name: "tonkotsu ramen").first
  review.user = user
  review.save!
  reviews << review
end

# 20~40 reviews also got vote randomly
reviews.each do |review|
  users.sample(rand(10..100)).each do |user|
    vote_review = VoteReview.new(vote: 1)
    vote_review.review = review
    vote_review.user = user
    vote_review.save!
  end
end


p "Seed done :D Let's check the page"




# def create_dish(users:, user_name:, user_photo:, user_resto:, user_categoty:)
#   dish = Dish.new(name: user_name, price: 2, photo: user_photo)
#   dish.restaurant = user_resto
#   dish.category = user_category
#   dish.save!

#   vote_dish = Vote.new(vote: rand(10)*13)
#   vote_dish.dish = dish
#   users.each do |user|
#     vote_dish.user = user
#   end

#   vote_dish.save!
#   return dish
# end


# create_dish({
#   users: user,
#   user_name:
#   user_photo:
#   user_resto:
# })
