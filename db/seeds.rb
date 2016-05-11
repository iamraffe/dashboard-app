100.times do |i|
  u = User.create({
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: "mysecretpassword",
        password_confirmation: "mysecretpassword",
        phone_number: Faker::PhoneNumber.phone_number,
        avatar: "https://randomuser.me/api/portraits/thumb/men/#{i}.jpg",
        # care_teams: c
      })

  u.care_teams << [c, ct].sample

  u.add_role :patient
end

100.times do |i|
  u = User.create({
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: "mysecretpassword",
        password_confirmation: "mysecretpassword",
        phone_number: Faker::PhoneNumber.phone_number,
        gender: "F",
        diabetes: [true, false].sample,
        heart_disease: [true, false].sample,
        date_of_birth: Faker::Time.between(50.years.ago, 5.years.ago),
        avatar: "https://randomuser.me/api/portraits/thumb/women/#{i}.jpg",
        # care_teams: c
      })

  u.care_teams << [c, ct].sample

  u.add_role :patient
end