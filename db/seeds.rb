$LOAD_PATH << File.join(Rails.root + 'db/create_dish.rb')
$LOAD_PATH << File.join(Rails.root + 'db/vote_review.rb')
require_relative 'create_dish.rb'
require_relative 'vote_review.rb'
require 'faker'

p "Destroy previous data"
Restaurant.destroy_all
Category.destroy_all
Dish.destroy_all
Review.destroy_all
VoteReview.destroy_all
ActiveRecord::Base.connection.execute("delete from users")


p "Adding 1001 Users"
user_photos = (10..99).to_a.map {|number| "https://randomuser.me/api/portraits/women/#{number}.jpg"} + (10..99).to_a.map {|number| "https://randomuser.me/api/portraits/men/#{number}.jpg"}
user_jay = User.create!(email: "jay@test.com", username: "unpretty_jay", password: "111111", photo: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/t62fonm8rnt2co5hngdn.jpg")
users_array = Array.new(1_000) { [Faker::Internet.unique.email, Faker::Name.first_name.gsub("'", "\"") + rand(100).to_s] }
values = users_array.map { |user| "(" + user.map { |s| "'#{s}'" }.join(", ") + ", '" + user_photos.sample(1).join("") + "', '2019-11-27', '2019-11-27'" + ")" }.join(", ")

query = "INSERT INTO users (email, username, photo, created_at, updated_at) VALUES #{values}"
ActiveRecord::Base.connection.execute(query)
users = []
User.all.each { |user| users << user}


p "Adding 3 Categories"
category_korean = Category.create!(name: "korean") # jekuk bibimbap
category_japanese = Category.create!(name: "japanese") # soyu ramen , salmon sushi, udon, yakitori, tempura
category_canadian = Category.create!(name: "canadian") # poutine, bagle

p "Adding 5 restaurants"

resto_ramen = Restaurant.create!(name: "Tsukuyomi", address: "5207 St Laurent Blvd, Montreal, Quebec H2T 1S4", photo: "https://portal.restomontreal.ca/tsukuyomi-ramen/gallery/images/App/10__462-2019-07-17.jpg", longitude: -73.5969526, latitude: 45.5241759)
resto_ramen_2 = Restaurant.create!(name: "Ramen Ya", address: "4274 St Laurent Blvd, Montreal, Quebec H2W 1Z3", photo: "http://www.ramen-ya.ca/img_index_main_on.jpg", longitude: -73.5854547, latitude: 45.518514)
resto_ramen_3 = Restaurant.create!(name: "Yokato Yokabai Ramen", address: "4185 Drolet St, Montreal, Quebec H2W 2L5", photo: "http://www.yoka.ca/restaurants/yokatoyokabai/website/images/header-logo.png?1560757380", longitude: -73.5807499, latitude: 45.5211845)
resto_ramen_4 = Restaurant.create!(name: "Ichigo Ichie Izakaya", address: "360 Rue Rachel E, Montréal, Quebec H2W 1E9", photo: "http://www.ichigoichie.ca/restaurants/ichigoichie/website/images/header-logo.png?1560757380", longitude: -73.5806502, latitude: 45.5213029)
resto_ramen_5 = Restaurant.create!(name: "Ramen Plaza", address: "6553 St Hubert St, Montreal, Quebec H2S 2M5", photo: "https://scontent.fyxk1-1.fna.fbcdn.net/v/t1.0-9/73472501_2509242252645922_4558609856260472832_o.jpg?_nc_cat=105&_nc_ohc=tMaLUCAqqAEAQlGL1FjSi844Be56DrZqr6fJV0MGpChC1MbR1GIMU0Tjw&_nc_ht=scontent.fyxk1-1.fna&oh=097d082beac75be7e5d5ea9f411dc29a&oe=5E3E5B27", longitude: -73.6060987, latitude: 45.5366659)
resto_poutine = Restaurant.create!(name: "Restaurant Chez Claudette", address: "351 Avenue Laurier E, Montréal, QC H2T 1G7", photo: "https://d6ozfheqtj1tz.cloudfront.net/ChIJpeAPttcbyUwRVbeex_y_Ul8/ZQTfdEwo86pmK5cp.jpg", longitude: -73.5922732, latitude: 45.5264567)
resto_poutine_2 = Restaurant.create!(name: "Poutineville", address: "5445 Gaspe Ave #105, Montreal, Quebec H2T 3B2", photo: "http://www.poutineville.com/gx/poutineVille-logo.svg", longitude: -73.5974723, latitude: 45.5244147)

resto_korean = Restaurant.create!(name: "Petit Seoul", address: "5245 St Laurent Blvd, Montreal, Quebec H2T 1S4", photo: "https://pbs.twimg.com/profile_images/936461490852384769/gVvSjrYT_400x400.jpg", longitude: -73.5974676, latitude: 45.5244052)

resto_sushi = Restaurant.create!(name: "Sushi Heaven", address: "52 Rue Saint Viateur O, Montréal, QC H2T 2K8", photo: "https://previews.123rf.com/images/butenkow/butenkow1608/butenkow160800750/61573925-sushi-logo-design-template-vector-illustration-of-icon.jpg", longitude: -73.6015907, latitude: 45.5250315)
resto_bagle = Restaurant.create!(name: "St-Viateur Bagel Shop", address: "5282 Boul St-Laurent, Montréal, QC H2T 1S5", photo: "https://www.stviateurbagel.com/static/images/logo.png", longitude: -73.6041531, latitude: 45.5226902)
resto_poutine = Restaurant.create!(name: "Poutineville", address: "5445 Gaspe Ave #105, Montreal, Quebec H2T 3B2", photo: "http://www.poutineville.com/gx/poutineVille-logo.svg", longitude: -73.619474, latitude: 45.5226888)
resto_japanese_1 = Restaurant.create!(name: "Shiki Sushi", address: "5055 St Denis St, Montreal, Quebec H2J 2L8", photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRJEhLPSq8mY28778xjxOXWQVRkOMs-UIwiXZFkTiPnQ3ILDzo1", longitude: -73.5910825, latitude: 45.5268483)
resto_japanese_2 = Restaurant.create!(name: "Sushi JinJin", address: "29 Rue Saint Viateur O, Montréal, QC H2T 2K7", photo: "data:image/jpeg;base64,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", longitude: -73.6016377, latitude: 45.5254117)
resto_japanese_3 = Restaurant.create!(name: "Ubi Sushi Boutique", address: "72 Rue Saint Viateur O, Montréal, QC H2T 2K8", photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRJMt0-Pd6p-nJldJ03-U1XuPQwjzt4rLvf7kYZ_Rl9F4OtMOfa", longitude: -73.6018366, latitude: 45.5247892)
resto_japanese_4 = Restaurant.create!(name: "Le Ti Poké", address: "5264 St Laurent Blvd, Montreal, Quebec H2T 1S1", photo: "data:image/png;base64,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", longitude: -73.5979325, latitude: 45.5242659)
resto_japanese_5 = Restaurant.create!(name: "Sake grillades", address: "5125 St Laurent Blvd, Montreal, Quebec H2T 1R9", photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQaJqXBBfBZ39WpOitE14EdJlGh81r6nVpFeeJhQsa4ek0QSzYZ", longitude: -73.5954192, latitude: 45.5233929)


p "Adding Dishes"
tonkotsu_ramen = create_dish("Tonkotsu Ramen",2,resto_ramen,category_japanese,420,450,"https://res.cloudinary.com/dsvdkyjhh/image/upload/v1575586131/Screen_Shot_2019-12-05_at_5.45.51_PM_atbtch.png")

create_dish("Shoyu ramen",3,resto_ramen_5,category_japanese,200,350,"https://www.seriouseats.com/2018/11/20181113-homemade-ramen-light-broth-chintan-shoyu-vicky-wasik-28-1500x1125.jpg")
create_dish("Spicy miso ramen",2,resto_ramen_5,category_japanese,200,350,"https://i.redd.it/fnyxtr112r701.jpg")
create_dish("Cold Ramen",2,resto_ramen,category_japanese,200,400,"https://portal.restomontreal.ca/tsukuyomi-ramen/gallery/images/24__462-2019-07-17.jpg")
create_dish("Vegan - Yuzu Ramen",2,resto_ramen,category_japanese,100,400,"https://portal.restomontreal.ca/tsukuyomi-ramen/gallery/images/21__462-2019-07-17.jpg")
create_dish("Chicken Tonkotsu Ramen",2,resto_ramen,category_japanese,100,400,"https://vignette.wikia.nocookie.net/ramen/images/c/c2/Tonkotsu_ramen_640.jpg/revision/latest?cb=20150514230437")
create_dish("Pork Tonkotsu Ramen",2,resto_ramen_2,category_japanese,300,400,"https://glebekitchen.com/wp-content/uploads/2017/02/ramenfront.jpg")
create_dish("Vege Tonkotsu Ramen",3,resto_ramen_3,category_japanese,100,300,"https://gastroplant.com/wp-content/uploads/2019/01/1811_Vegan-Tonkotsu-Ramen_550-480x270.jpg")
create_dish("Chashu Shoyu Ramen",4,resto_ramen_3,category_japanese,100,300,"https://media-cdn.tripadvisor.com/media/photo-s/08/bb/5e/7d/chashu-shoyu-ramen.jpg")

create_dish("Hiyashi Don",4,resto_ramen_5,category_japanese,600,700,"https://scontent.fyxk1-1.fna.fbcdn.net/v/t1.0-9/64589649_2386124424957706_5031007850244079616_o.jpg?_nc_cat=103&_nc_ohc=GtZrNdP4O_8AQlfQ4IIHii_dpvZ7V0FS7tmtIWz3eiA_fmahBjTplPM5A&_nc_ht=scontent.fyxk1-1.fna&oh=6c16b19bb9f554a3ee69cb7d714a0510&oe=5E47A1C9")
create_dish("Yakitori",3,resto_ramen_4,category_japanese,500,600,"http://www.ichigoichie.ca/restaurants/ichigoichie/gallery/7_large.jpg")
create_dish("Agedashi Tofu",3,resto_ramen_4,category_japanese,300,400,"http://www.ichigoichie.ca/restaurants/ichigoichie/gallery/6_large.jpg")
create_dish("Chirashi Don",4,resto_ramen_5,category_japanese,100,200,"https://scontent.fyxk1-1.fna.fbcdn.net/v/t1.0-9/52920210_2307926926110790_5575701156115513344_o.jpg?_nc_cat=103&_nc_ohc=K_8GPW3za4YAQnRklr_RqnaRpGfwrnoShq59N9q1v1Mh8ei5W_9DqboVw&_nc_ht=scontent.fyxk1-1.fna&oh=1e782b5a0fefdeb4112284b93f0f0732&oe=5E416EC7")
create_dish("Chicken Karaage",4,resto_ramen,category_japanese,300,350,"https://static01.nyt.com/images/2018/07/25/dining/HK-karaage-horizontal/merlin_141075300_74569dec-9fc2-4174-931d-019dddef3bb8-articleLarge.jpg")
create_dish("Chashu Donburi",3,resto_ramen,category_japanese,100,300,"https://burpple-1.imgix.net/foods/38aafc290086359155a1535729_original.?w=645&dpr=1&fit=crop&q=80&auto=format")
create_dish("Pork Katsu Curry",2,resto_ramen_2,category_japanese,100,300,"https://www.justonecookbook.com/wp-content/uploads/2014/06/Katsu-Curry-500x467.jpg")
create_dish("Sweet Potato Fries",1,resto_ramen_3,category_japanese,100,300,"http://www.yoka.ca/restaurants/yokatoyokabai/gallery/8_large.jpg")
create_dish("Ika Yaki",3,resto_ramen_4,category_japanese,100,300,"https://s3.amazonaws.com/Menu_Pic/8abef4c0-aaf7-4c31-905d-0ef5f9aaaf24_ika-yaki.jpg")

create_dish("Beef Rib",4,resto_poutine_2,category_canadian,420,450,"https://i.ytimg.com/vi/_-BYANCZP0o/maxresdefault.jpg")
# create_dish("JeKuk Bibmbap",3,resto_korean,category_korean,420,450,"https://www.touristsecrets.com/wp-content/uploads/1019/06/1-Featured-image-Korean-BBQ-by-arjieljosephfg-on-Instagram-1160x653.jpg")
create_dish("Soondubu Jjigae",2,resto_korean,category_korean,400,420,"https://upload.wikimedia.org/wikipedia/commons/0/02/Sundubu-jjigae.jpg")
create_dish("Cabane Poutine",3,resto_poutine,category_canadian,380,400,"https://s3-media0.fl.yelpcdn.com/bphoto/4g01wVDPhrcDaeqIauEK-g/o.jpg")
create_dish("Vol au vent Poutine",2,resto_poutine,category_canadian,300,400,"https://s3-media0.fl.yelpcdn.com/bphoto/aFDkxdA1rpdqRaM-2o7FWw/o.jpg")
create_dish("New York Poutine",3,resto_poutine,category_canadian,100,300,"https://s3-media0.fl.yelpcdn.com/bphoto/SSpHGJZXBqguBSKmmYkDaw/o.jpg")
create_dish("Smoked meat Poutine",4,resto_poutine,category_canadian,100,300,"https://s3-media0.fl.yelpcdn.com/bphoto/jLi42rFbJo9JixyAbGNPqQ/o.jpg")
create_dish("Pharaon",2,resto_poutine,category_canadian,100,300,"https://s3-media0.fl.yelpcdn.com/bphoto/yoMPmXqIsKSFS0f9XhLVUg/o.jpg")
create_dish("Bavette",4,resto_poutine_2,category_canadian,300,400,"https://goop.com/wp-content/uploads/2015/09/GrilledHangerSteakerChimichurri.jpg")
create_dish("Pulled Pork Sandwich",3,resto_poutine_2,category_canadian,100,300,"https://s3-media0.fl.yelpcdn.com/bphoto/1Sgjt3K7Kbsvkr86Z2N4KA/o.jpg")
create_dish("Beef tartare",2,resto_poutine_2,category_canadian,100,300,"https://s3-media0.fl.yelpcdn.com/bphoto/5mGYCP2E1sXICQnnurMQ6A/o.jpg")
create_dish("Oysters",4,resto_poutine_2,category_canadian,100,300,"https://s3-media0.fl.yelpcdn.com/bphoto/-VLri98P4EooqsNyG55iPA/o.jpg")
create_dish("Sushi",1,resto_japanese_1,category_japanese,100,300,"https://enjoysushi.fr/media/catalog/product/cache/3/small_image/390x390/9df78eab33525d08d6e5fb8d27136e95/p/l/plateau_super_saumon-web.jpg")
create_dish("Maki",1,resto_japanese_1,category_japanese,100,300,"https://www.japanesecooking101.com/wp-content/uploads/2017/08/DSC00102.jpg")
create_dish("Miso soup",1,resto_japanese_1,category_japanese,100,300,"https://www.japanesecooking101.com/wp-content/uploads/2012/03/IMG_6524-1024x682.jpg")
create_dish("Poke Bowl",2,resto_japanese_2,category_japanese,100,300,"https://s3-media0.fl.yelpcdn.com/bphoto/F1aVN6UazN12dvqeRlq93g/o.jpg")
create_dish("Chicken Katsu",2,resto_japanese_3,category_japanese,100,300,"https://s3-media0.fl.yelpcdn.com/bphoto/pwbKUTRrlDm_tfUXZ03LLg/o.jpg")
create_dish("Pablo Ying",2,resto_japanese_4,category_japanese,100,300,"https://d1ralsognjng37.cloudfront.net/93ce43b5-2f89-44d8-ba37-caff9e307a73")
create_dish("Tataki au thon",2,resto_japanese_5,category_japanese,100,300,"https://d1ralsognjng37.cloudfront.net/0ed0b403-13fd-4cf6-9584-fe6e07acae56")
create_dish("Tongkatsu",2,resto_korean,category_korean,300,400,"https://www.japanesecooking101.com/wp-content/uploads/2012/03/IMG_6705-e1333350334486.jpg")
create_dish("Hoe Deopbap",2,resto_korean,category_korean,300,400,"https://upload.wikimedia.org/wikipedia/commons/b/b8/Korean_food-Hoedeopbap-01.jpg")

create_dish("Beef Gyoza",2,resto_ramen_2,category_japanese,400,420,"https://img.taste.com.au/QpExN-2A/taste/2016/11/beef-gyoza-with-black-vinegar-dipping-sauce-7322-1.jpeg")



p "Creating Reviews/ Review Votes"


# Creating Top Review of Ramen - TBU
review_third = Review.new(content: "This ramen joint is amazing but what really makes my days is their Tonkotsu Ramen! Its a Pork broth soup with nice firm thin noodles, perfectly cooked boiled eggs and tender pork belly roasted to perfection.", photo: "https://portal.restomontreal.ca/tsukuyomi-ramen/gallery/images/15__462-2019-07-17.jpg")
review_third.dish = Dish.where(name: "Tonkotsu Ramen").first
review_third.user = User.all[5] # This user need to catch up
review_third.save!

# 100~200 people upvoting for Top Review
users.sample(rand(120..150)).each do |user|
  vote_review(user, review_third)
end

# Creating Second Review of Ramen - TBU
review_second = Review.new(content: "To make things even better if you are a spicy lover, make sure to ask for Spicy Miso, it will blow your mind.")
review_second.dish = Dish.where(name: "Tonkotsu Ramen").first
review_second.user = User.all[4]
review_second.save!

# 100~200 people upvoting for second Review
users.sample(rand(100..120)).each do |user|
  vote_review(user, review_second)
end

# Creating Top Review of Ramen - TBU
review_top = Review.new(content: "The Ramen has special taste, I have lived in Tokyo for 5 years, but the soup is favorite", photo: "https://i.redd.it/c0e87106cgky.jpg")
review_top.dish = Dish.where(name: "Tonkotsu Ramen").first
review_top.user = User.all[3]
review_top.save!

# 100~200 people upvoting for Top Review
users.sample(rand(80..100)).each do |user|
  vote_review(user, review_top)
end


############## all dish got

reviews_all = []

Dish.all.each do |dish|
  users.sample(rand(5..10)).each do |user|
    review = Review.new(content: Faker::Restaurant.review)
    review.dish = dish
    review.user = user
    review.save!
    reviews_all << review
  end
end

reviews_all.each do |review|
  users.sample(rand(10..80)).each do |user|
    vote_review(user, review)
  end
end

#################################################################
reviews = []

# 20~40 uesrs left reviews on tonkotsu ramen
users.sample(rand(20..30)).each do |user|
  review = Review.new(content: Faker::Restaurant.review)
  review.dish = Dish.where(name: "Tonkotsu Ramen").first
  review.user = user
  review.save!
  reviews << review
end

# 20~40 reviews also got vote randomly
reviews.each do |review|
  users.sample(rand(10..80)).each do |user|
    vote_review(user, review)
  end
end


############################################################
reviews_new = []
# 20~40 uesrs left reviews on tonkotsu ramen
users.sample(rand(50..100)).each do |user|
  review = Review.new(content: Faker::Restaurant.review)
  review.dish = Dish.where(name: "Beef Gyoza").first
  review.user = user
  review.save!
  reviews_new << review
end

# 20~40 reviews_new also got vote randomly
reviews_new.each do |review|
  users.sample(rand(10..80)).each do |user|
    vote_review(user, review)
  end
end











p "Seed done :D Let's check the page"


