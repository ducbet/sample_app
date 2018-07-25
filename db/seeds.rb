User.create!(name: "tmd",
             email: "a@a.a",
             password: "asdqwe",
             password_confirmation: "asdqwe",
             admin: true)

User.create!(name: "tmd",
             email: "b@b.b",
             password: "asdqwe",
             password_confirmation: "asdqwe")

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end
