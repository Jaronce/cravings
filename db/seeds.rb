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
user_jay = User.create!(email: "test@test.com", username: "unpretty_jay", password: "1234", photo: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/t62fonm8rnt2co5hngdn.jpg")
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
resto_ramen_2 = Restaurant.create!(name: "Ramen Ya", address: "4274 St Laurent Blvd, Montreal, Quebec H2W 1Z3", photo: "https://www.iconfinder.com/data/icons/food-and-drinks-flat-circle-shadow-vol-4/100/noodle__food__pasta__asia__fastfood__chinese__eat-512.png", longitude: -73.5854547, latitude: 45.518514)
resto_ramen_3 = Restaurant.create!(name: "Yokato Yokabai Ramen", address: "4185 Drolet St, Montreal, Quebec H2W 2L5", photo: "https://www.netclipart.com/pp/m/170-1707287_cutlery-images-circle-food-icon-png.png", longitude: -73.5807499, latitude: 45.5211845)
resto_ramen_4 = Restaurant.create!(name: "Ichigo Ichie Izakaya", address: "360 Rue Rachel E, Montréal, Quebec H2W 1E9", photo: "https://i.pinimg.com/originals/b2/63/6f/b2636fbf69b1f3f4d1fb5d2d82b05bb2.png", longitude: -73.5806502, latitude: 45.5213029)
resto_ramen_5 = Restaurant.create!(name: "Ramen Plaza", address: "6553 St Hubert St, Montreal, Quebec H2S 2M5", photo: "https://scontent.fyxk1-1.fna.fbcdn.net/v/t1.0-9/73472501_2509242252645922_4558609856260472832_o.jpg?_nc_cat=105&_nc_ohc=tMaLUCAqqAEAQlGL1FjSi844Be56DrZqr6fJV0MGpChC1MbR1GIMU0Tjw&_nc_ht=scontent.fyxk1-1.fna&oh=097d082beac75be7e5d5ea9f411dc29a&oe=5E3E5B27", longitude: -73.6060987, latitude: 45.5366659)
resto_poutine = Restaurant.create!(name: "Restaurant Chez Claudette", address: "351 Avenue Laurier E, Montréal, QC H2T 1G7", photo: "https://d6ozfheqtj1tz.cloudfront.net/ChIJpeAPttcbyUwRVbeex_y_Ul8/ZQTfdEwo86pmK5cp.jpg", longitude: -73.5922732, latitude: 45.5264567)
resto_poutine_2 = Restaurant.create!(name: "Poutineville", address: "5445 Gaspe Ave #105, Montreal, Quebec H2T 3B2", photo: "http://www.poutineville.com/gx/poutineVille-logo.svg", longitude: -73.5974723, latitude: 45.5244147)

resto_korean = Restaurant.create!(name: "Petit Seoul", address: "5245 St Laurent Blvd, Montreal, Quebec H2T 1S4", photo: "https://pbs.twimg.com/profile_images/936461490852384769/gVvSjrYT_400x400.jpg", longitude: -73.5974676, latitude: 45.5244052)

resto_sushi = Restaurant.create!(name: "Sushi Heaven", address: "52 Rue Saint Viateur O, Montréal, QC H2T 2K8", photo: "https://previews.123rf.com/images/butenkow/butenkow1608/butenkow160800750/61573925-sushi-logo-design-template-vector-illustration-of-icon.jpg", longitude: -73.6015907, latitude: 45.5250315)
resto_bagle = Restaurant.create!(name: "St-Viateur Bagel Shop", address: "5282 Boul St-Laurent, Montréal, QC H2T 1S5", photo: "https://www.stviateurbagel.com/static/images/logo.png", longitude: -73.6041531, latitude: 45.5226902)
resto_poutine = Restaurant.create!(name: "Chez Claudette", address: "5445 Gaspe Ave #105, Montreal, Quebec H2T 3B2", photo: "http://www.poutineville.com/gx/poutineVille-logo.svg", longitude: -73.619474, latitude: 45.5226888)
resto_japanese_1 = Restaurant.create!(name: "Shiki Sushi", address: "5055 St Denis St, Montreal, Quebec H2J 2L8", photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRJEhLPSq8mY28778xjxOXWQVRkOMs-UIwiXZFkTiPnQ3ILDzo1", longitude: -73.5910825, latitude: 45.5268483)
resto_japanese_2 = Restaurant.create!(name: "Sushi JinJin", address: "29 Rue Saint Viateur O, Montréal, QC H2T 2K7", photo: "https://dynamic.brandcrowd.com/asset/logo/7e69ffe7-c1bf-4cca-82f4-873cb2acbd5c/logo?v=4", longitude: -73.6016377, latitude: 45.5254117)
resto_japanese_3 = Restaurant.create!(name: "Ubi Sushi Boutique", address: "72 Rue Saint Viateur O, Montréal, QC H2T 2K8", photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRJMt0-Pd6p-nJldJ03-U1XuPQwjzt4rLvf7kYZ_Rl9F4OtMOfa", longitude: -73.6018366, latitude: 45.5247892)
resto_japanese_4 = Restaurant.create!(name: "Le Ti Poké", address: "5264 St Laurent Blvd, Montreal, Quebec H2T 1S1", photo: "https://www.deluxe.com/sites/deluxe.signupserver.com/files/DeluxeLogosWebArt/Restaurant/restaurant-2.jpg", longitude: -73.5979325, latitude: 45.5242659)
resto_japanese_5 = Restaurant.create!(name: "Sake grillades", address: "5125 St Laurent Blvd, Montreal, Quebec H2T 1R9", photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQaJqXBBfBZ39WpOitE14EdJlGh81r6nVpFeeJhQsa4ek0QSzYZ", longitude: -73.5954192, latitude: 45.5233929)


p "Adding Dishes"
tonkotsu_ramen = create_dish("Tonkotsu Ramen",2,resto_ramen,category_japanese,950,1000,"https://res.cloudinary.com/dsvdkyjhh/image/upload/v1575586131/Screen_Shot_2019-12-05_at_5.45.51_PM_atbtch.png")

create_dish("Shoyu ramen",3,resto_ramen_5,category_japanese,200,350,"https://www.seriouseats.com/2018/11/20181113-homemade-ramen-light-broth-chintan-shoyu-vicky-wasik-28-1500x1125.jpg")
create_dish("Spicy miso ramen",2,resto_ramen_5,category_japanese,200,350,"https://i.redd.it/fnyxtr112r701.jpg")
create_dish("Cold Ramen",2,resto_ramen,category_japanese,200,400,"https://portal.restomontreal.ca/tsukuyomi-ramen/gallery/images/24__462-2019-07-17.jpg")
create_dish("Vegan - Yuzu Ramen",2,resto_ramen,category_japanese,200,400,"https://portal.restomontreal.ca/tsukuyomi-ramen/gallery/images/21__462-2019-07-17.jpg")
create_dish("Chicken Ramen",2,resto_ramen,category_japanese,100,200,"https://vignette.wikia.nocookie.net/ramen/images/c/c2/Tonkotsu_ramen_640.jpg/revision/latest?cb=20150514230437")
create_dish("Pork Ramen",2,resto_ramen_2,category_japanese,100,200,"https://glebekitchen.com/wp-content/uploads/2017/02/ramenfront.jpg")
create_dish("Vege Ramen",3,resto_ramen_3,category_japanese,300,500,"https://gastroplant.com/wp-content/uploads/2019/01/1811_Vegan-Tonkotsu-Ramen_550-480x270.jpg")
create_dish("Chashu Ramen",4,resto_ramen_3,category_japanese,100,200,"https://media-cdn.tripadvisor.com/media/photo-s/08/bb/5e/7d/chashu-shoyu-ramen.jpg")

create_dish("Chicken Karaage",4,resto_ramen,category_japanese,800,900,"https://static01.nyt.com/images/2018/07/25/dining/HK-karaage-horizontal/merlin_141075300_74569dec-9fc2-4174-931d-019dddef3bb8-articleLarge.jpg")
create_dish("Chashu Donburi",3,resto_ramen,category_japanese,600,650,"https://burpple-1.imgix.net/foods/38aafc290086359155a1535729_original.?w=645&dpr=1&fit=crop&q=80&auto=format")
create_dish("Pork Katsu Curry",2,resto_ramen_2,category_japanese,200,300,"https://www.justonecookbook.com/wp-content/uploads/2014/06/Katsu-Curry-500x467.jpg")
create_dish("Ika Yaki",3,resto_ramen_4,category_japanese,100,200,"https://s3.amazonaws.com/Menu_Pic/8abef4c0-aaf7-4c31-905d-0ef5f9aaaf24_ika-yaki.jpg")
create_dish("Pablo Ying",2,resto_japanese_4,category_japanese,300,500,"https://d1ralsognjng37.cloudfront.net/93ce43b5-2f89-44d8-ba37-caff9e307a73")
create_dish("Tataki au thon",2,resto_japanese_5,category_japanese,300,500,"https://d1ralsognjng37.cloudfront.net/0ed0b403-13fd-4cf6-9584-fe6e07acae56")

create_dish("Beef Rib",4,resto_poutine_2,category_canadian,420,450,"https://i.ytimg.com/vi/_-BYANCZP0o/maxresdefault.jpg")
create_dish("Sweet Potato Fries",1,resto_ramen_3,category_japanese,100,200,"http://www.yoka.ca/restaurants/yokatoyokabai/gallery/8_large.jpg")
create_dish("Chirashi Don",4,resto_ramen_5,category_japanese,100,200,"https://scontent.fyxk1-1.fna.fbcdn.net/v/t1.0-9/52920210_2307926926110790_5575701156115513344_o.jpg?_nc_cat=103&_nc_ohc=K_8GPW3za4YAQnRklr_RqnaRpGfwrnoShq59N9q1v1Mh8ei5W_9DqboVw&_nc_ht=scontent.fyxk1-1.fna&oh=1e782b5a0fefdeb4112284b93f0f0732&oe=5E416EC7")
create_dish("Soondubu Jjigae",2,resto_korean,category_korean,410,420,"http://www.fsnews.co.kr/news/photo/201806/29405_24746_5517.jpg")
create_dish("Tongkatsu",2,resto_korean,category_korean,400,410,"https://www.japanesecooking101.com/wp-content/uploads/2012/03/IMG_6705-e1333350334486.jpg")
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
create_dish("Hoe Deopbap",2,resto_korean,category_korean,300,400,"https://upload.wikimedia.org/wikipedia/commons/b/b8/Korean_food-Hoedeopbap-01.jpg")

create_dish("Beef Gyoza",2,resto_ramen_2,category_japanese,250,300,"https://img.taste.com.au/QpExN-2A/taste/2016/11/beef-gyoza-with-black-vinegar-dipping-sauce-7322-1.jpeg")



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


############## all dish got review

reviews_all = []

Dish.all.each do |dish|
  users.sample(rand(5)).each do |user|
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


