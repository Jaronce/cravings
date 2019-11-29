$LOAD_PATH << File.join(Rails.root + 'db/create_dish.rb')
require_relative 'create_dish.rb'
require 'faker'
require 'csv'

# csv_text = File.read('...')
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|
#   Moulding.create!(row.to_hash)
# end



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



p "Adding 3 Categories"
category_korean = Category.create!(name: "Korean") # jekuk bibimbap
category_japanese = Category.create!(name: "Japanese") # soyu ramen , salmon sushi, udon, yakitori, tempura
category_canadian = Category.create!(name: "Canadian") # poutine, bagle



p "Adding 5 restaurants"
resto_ramen = Restaurant.create!(name: "Tsukuyomi", address: "5207 St Laurent Blvd, Montreal, Quebec H2T 1S4", photo: "https://lh5.googleusercontent.com/p/AF1QipNEaYzqjpsgHnw0sF7qZFGqDO9Y1e5dNPQCY45_=w203-h152-k-no")
resto_ramen_2 = Restaurant.create!(name: "Ramen Ya", address: "4274 St Laurent Blvd, Montreal, Quebec H2W 1Z3", photo: "http://www.ramen-ya.ca/img_index_main_on.jpg")
resto_ramen_3 = Restaurant.create!(name: "Yokato Yokabai Ramen", address: "4185 Drolet St, Montreal, Quebec H2W 2L5", photo: "http://www.yoka.ca/restaurants/yokatoyokabai/website/images/header-logo.png?1560757380")
resto_ramen_4 = Restaurant.create!(name: "Ichigo Ichie Izakaya", address: "360 Rue Rachel E, Montréal, Quebec H2W 1E9", photo: "http://www.ichigoichie.ca/restaurants/ichigoichie/website/images/header-logo.png?1560757380")
resto_ramen_5 = Restaurant.create!(name: "Ramen Plaza", address: "6553 St Hubert St, Montreal, Quebec H2S 2M5", photo: "https://scontent.fyxk1-1.fna.fbcdn.net/v/t1.0-9/73472501_2509242252645922_4558609856260472832_o.jpg?_nc_cat=105&_nc_ohc=tMaLUCAqqAEAQlGL1FjSi844Be56DrZqr6fJV0MGpChC1MbR1GIMU0Tjw&_nc_ht=scontent.fyxk1-1.fna&oh=097d082beac75be7e5d5ea9f411dc29a&oe=5E3E5B27")
resto_poutine = Restaurant.create!(name: "Restaurant Chez Claudette", address: "351 Avenue Laurier E, Montréal, QC H2T 1G7", photo: "https://d6ozfheqtj1tz.cloudfront.net/ChIJpeAPttcbyUwRVbeex_y_Ul8/ZQTfdEwo86pmK5cp.jpg")
resto_poutine_2 = Restaurant.create!(name: "Poutineville", address: "5445 Gaspe Ave #105, Montreal, Quebec H2T 3B2", photo: "http://www.poutineville.com/gx/poutineVille-logo.svg")

resto_korean = Restaurant.create!(name: "Petit Seoul", address: "5245 St Laurent Blvd, Montreal, Quebec H2T 1S4", photo: "https://pbs.twimg.com/profile_images/936461490852384769/gVvSjrYT_400x400.jpg")
resto_sushi = Restaurant.create!(name: "Sushi Heaven", address: "52 Rue Saint Viateur O, Montréal, QC H2T 2K8", photo: "https://previews.123rf.com/images/butenkow/butenkow1608/butenkow160800750/61573925-sushi-logo-design-template-vector-illustration-of-icon.jpg")
resto_bagle = Restaurant.create!(name: "St-Viateur Bagel Shop", address: "5282 Boul St-Laurent, Montréal, QC H2T 1S5", photo: "https://www.stviateurbagel.com/static/images/logo.png")



p "Adding Dishes"
tonkotsu_ramen = create_dish("Tonkotsu Ramen",2,resto_ramen,category_japanese,600,900,"https://portal.restomontreal.ca/tsukuyomi-ramen/gallery/images/01__462-2019-07-17.jpg")
jekuk_bibimbap = create_dish("JeKuk Bibmbap", 3, resto_korean, category_korean, 500, 700, "https://www.touristsecrets.com/wp-content/uploads/1019/06/1-Featured-image-Korean-BBQ-by-arjieljosephfg-on-Instagram-1160x653.jpg")


# CSV.foreach(Rails.root.join('db/file.csv'), headers: true) do |row|
#   create_dish(row[0],row[2],row[3],row[4],row[5],row[6],row[7])
# end


create_dish("Cold Ramen",2,resto_ramen,category_japanese,200,400,"https://portal.restomontreal.ca/tsukuyomi-ramen/gallery/images/24__462-2019-07-17.jpg")
create_dish("Vegan - Yuzu Ramen",2,resto_ramen,category_japanese,100,400,"https://portal.restomontreal.ca/tsukuyomi-ramen/gallery/images/21__462-2019-07-17.jpg")
create_dish("Chicken Tonkotsu Ramen",2,resto_ramen,category_japanese,100,400,"https://portal.restomontreal.ca/tsukuyomi-ramen/gallery/images/02__462-2019-07-17.jpg")
create_dish("Chicken Karaage",4,resto_ramen,category_japanese,100,300,"https://portal.restomontreal.ca/tsukuyomi-ramen/gallery/images/17__462-2019-07-17.jpg")
create_dish("Chashu Donburi",3,resto_ramen,category_japanese,100,300,"https://portal.restomontreal.ca/tsukuyomi-ramen/gallery/images/25__462-2019-07-17.jpg")
create_dish("Pork Tonkotsu Ramen",2,resto_ramen_2,category_japanese,300,400,"https://lh5.googleusercontent.com/p/AF1QipMraX9JzfBZB0iOI1Sd3XL4XjxV0Ai7He8y3yMI=w203-h152-k-no")
create_dish("Beef Gyoza",2,resto_ramen_2,category_japanese,300,400,"https://lh5.googleusercontent.com/p/AF1QipN9RgdTMG7w1PVU3pTX9qSIX2y6AJrY5Q29aIT5=w203-h152-k-no")
create_dish("Pork Katsu Curry",2,resto_ramen_2,category_japanese,100,300,"https://lh5.googleusercontent.com/p/AF1QipOBZjdPrAUuL-1AECsiLLP9MaNprWSQbzXEMjLD=s773-k-no")
create_dish("Vege Tonkotsu Ramen",3,resto_ramen_3,category_japanese,100,300,"https://lh5.googleusercontent.com/p/AF1QipNH5kN03CYaaSfk3AHafLK7R_wgO1MjWqyCNQA3=w203-h152-k-no")
create_dish("Chashu Shoyu Ramen",4,resto_ramen_3,category_japanese,100,300,"https://lh5.googleusercontent.com/p/AF1QipNnazqH01sSLZ4LOs9giMNHZwEk9BR3Cvs0nKBE=w203-h152-k-no")
create_dish("Sweet Potato Fries",1,resto_ramen_3,category_japanese,100,300,"http://www.yoka.ca/restaurants/yokatoyokabai/gallery/8_large.jpg")
create_dish("Yakitori",3,resto_ramen_4,category_japanese,300,400,"http://www.ichigoichie.ca/restaurants/ichigoichie/gallery/7_large.jpg")
create_dish("Agedashi Tofu",3,resto_ramen_4,category_japanese,300,400,"http://www.ichigoichie.ca/restaurants/ichigoichie/gallery/6_large.jpg")
create_dish("Ika Yaki",3,resto_ramen_4,category_japanese,100,300,"https://lh5.googleusercontent.com/p/AF1QipOojqQOqEvc6tB39Hk6STCTpPN0LuAqzBm-TBir=w203-h114-k-no")
create_dish("Shoyu ramen",3,resto_ramen_5,category_japanese,300,400,"https://scontent.fyxk1-1.fna.fbcdn.net/v/t1.0-9/69835761_2444724279097720_5709248658763939840_n.jpg?_nc_cat=107&_nc_ohc=zrD9v77LYHcAQk5YgsoFSF5S7MAyUnyJ_9CO8zV9RfR0nrQSKrrjTMjzg&_nc_ht=scontent.fyxk1-1.fna&oh=e8d45b078bdc431e1dd471d510c026bc&oe=5E89DAC9")
create_dish("Spicy miso ramen",2,resto_ramen_5,category_japanese,300,400,"https://scontent.fyxk1-1.fna.fbcdn.net/v/t1.0-9/70037164_2451550078415140_5918481259058692096_o.jpg?_nc_cat=111&_nc_ohc=ffzjLqRGpk4AQkxVg-nTZnmNDy1vJmHLRiQAH009yoZhb91NwcKxdpxAw&_nc_ht=scontent.fyxk1-1.fna&oh=11585f0c174d7287cfd79627cc9f151a&oe=5E4CEC8F")
create_dish("Hiyashi Don",4,resto_ramen_5,category_japanese,100,300,"https://scontent.fyxk1-1.fna.fbcdn.net/v/t1.0-9/64589649_2386124424957706_5031007850244079616_o.jpg?_nc_cat=103&_nc_ohc=GtZrNdP4O_8AQlfQ4IIHii_dpvZ7V0FS7tmtIWz3eiA_fmahBjTplPM5A&_nc_ht=scontent.fyxk1-1.fna&oh=6c16b19bb9f554a3ee69cb7d714a0510&oe=5E47A1C9")
create_dish("Chirashi Don",4,resto_ramen_5,category_japanese,100,300,"https://scontent.fyxk1-1.fna.fbcdn.net/v/t1.0-9/52920210_2307926926110790_5575701156115513344_o.jpg?_nc_cat=103&_nc_ohc=K_8GPW3za4YAQnRklr_RqnaRpGfwrnoShq59N9q1v1Mh8ei5W_9DqboVw&_nc_ht=scontent.fyxk1-1.fna&oh=1e782b5a0fefdeb4112284b93f0f0732&oe=5E416EC7")
create_dish("Cabane Poutine",3,resto_poutine,category_canadian,300,400,"https://s3-media0.fl.yelpcdn.com/bphoto/4g01wVDPhrcDaeqIauEK-g/o.jpg")
create_dish("Vol au vent Poutine",2,resto_poutine,category_canadian,300,400,"https://s3-media0.fl.yelpcdn.com/bphoto/aFDkxdA1rpdqRaM-2o7FWw/o.jpg")
create_dish("New York Poutine",3,resto_poutine,category_canadian,100,300,"https://s3-media0.fl.yelpcdn.com/bphoto/SSpHGJZXBqguBSKmmYkDaw/o.jpg")
create_dish("Smoked meat Poutine",4,resto_poutine,category_canadian,100,300,"https://s3-media0.fl.yelpcdn.com/bphoto/jLi42rFbJo9JixyAbGNPqQ/o.jpg")
create_dish("Pharaon",2,resto_poutine,category_canadian,100,300,"https://s3-media0.fl.yelpcdn.com/bphoto/yoMPmXqIsKSFS0f9XhLVUg/o.jpg")
create_dish("Beef Rib",4,resto_poutine_2,category_canadian,300,400,"https://s3-media0.fl.yelpcdn.com/bphoto/QLshgiQVbH_mzeJHtzM9BA/o.jpg")
create_dish("Bavette",4,resto_poutine_2,category_canadian,300,400,"https://s3-media0.fl.yelpcdn.com/bphoto/GCvwBUwqdt826U80Ola_LQ/o.jpg")
create_dish("Pulled Pork Sandwich",3,resto_poutine_2,category_canadian,100,300,"https://s3-media0.fl.yelpcdn.com/bphoto/1Sgjt3K7Kbsvkr86Z2N4KA/o.jpg")
create_dish("Beef tartare",2,resto_poutine_2,category_canadian,100,300,"https://s3-media0.fl.yelpcdn.com/bphoto/5mGYCP2E1sXICQnnurMQ6A/o.jpg")
create_dish("Oysters",4,resto_poutine_2,category_canadian,100,300,"https://s3-media0.fl.yelpcdn.com/bphoto/-VLri98P4EooqsNyG55iPA/o.jpg")

# Add more korean
(1..7).to_a.each { |e| create_dish( (Faker::Food.ingredient + " Bap"), rand(1..5), resto_korean, category_korean, 50, 400, "https://www.touristsecrets.com/wp-content/uploads/1019/06/1-Featured-image-Korean-BBQ-by-arjieljosephfg-on-Instagram-1160x653.jpg")}
# Add more sushi
(1..7).to_a.each { |e| create_dish( (Faker::Food.ingredient + " Sushi"), rand(1..5), resto_sushi, category_japanese, 50, 400, "https://www.touristsecrets.com/wp-content/uploads/1019/06/1-Featured-image-Korean-BBQ-by-arjieljosephfg-on-Instagram-1160x653.jpg")}
# Add more canadian
(1..7).to_a.each { |e| create_dish( (Faker::Food.ingredient + " Poutine"), rand(1..5), resto_poutine, category_canadian, 50, 400, "https://www.touristsecrets.com/wp-content/uploads/1019/06/1-Featured-image-Korean-BBQ-by-arjieljosephfg-on-Instagram-1160x653.jpg")}




p "Creating Reviews/ Review Votes"


reviews = []

# Creating Top Review of Ramen - TBU
review_top = Review.new(content: "This one should be on the top", photo: "https://i.redd.it/c0e87106cgky.jpg")
review_top.dish = Dish.where(name: "Tonkotsu Ramen").first
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
  review.dish = Dish.where(name: "Tonkotsu Ramen").first
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



