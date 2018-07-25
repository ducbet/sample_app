User.create! name: "tmd",
             email: "a@a.a",
             password: "asdasd",
             password_confirmation: "asdasd",
             admin: true,
             activated: true,
             activated_at: Time.zone.now

User.create! name: "tmd",
             email: "b@b.b",
             password: "asdasd",
             password_confirmation: "asdasd",
             activated: true,
             activated_at: Time.zone.now

98.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "asdasd"
  User.create! name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now
end
