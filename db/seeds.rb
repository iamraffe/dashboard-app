100.times do |i|
  u = User.create({
        first_name: Faker::Name.first_name,
        username: Faker::Lorem.word,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: "mysecretpassword",
        password_confirmation: "mysecretpassword",
      })
end

100.times do |i|
  u = User.create({
        first_name: Faker::Name.first_name,
        username: Faker::Lorem.word,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: "mysecretpassword",
        password_confirmation: "mysecretpassword",
      })
end