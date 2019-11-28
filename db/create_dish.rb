
def create_dish(food_name, price, user_resto, user_category, starting_num, finishing_number, user_photo)
  dish = Dish.new(name: food_name, price: price, photo: user_photo)
  dish.restaurant = user_resto
  dish.category = user_category
  dish.save!

  users = User.all.sample(rand(starting_num..finishing_number))
  users.each do |user|
    vote = Vote.new(vote: 1)
    vote.user = user
    vote.dish = dish
    vote.save!
  end
end


# a = create_dish("sample.jpeg", resto_korean, category_korean, 50, 400)
