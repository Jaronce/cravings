require 'faker'

users = {}
1000.times do
  users << User.create!(email: Faker::Internet.unique.email, username: Faker::Name.unique.name, password: "111111", photo: "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png")
  File.write('users.json', JSON.generate(user))
end

# require 'json'
# filepath = 'users.json'
# serialized_user = File.read(filepath)
# user = JSON.parse(serialized_user)
