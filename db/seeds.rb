# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# User.create!(username:  "Example User", password: "password", password_confirmation: "password")

@doctor1 = Doctor.create!(name: 'Nandita Sarchand', specialization: 'eye specialist', available_times: 'monday-friday', hourly_rate: 250, picture: ('https://asset.cloudinary.com/dcphbr3ka/607f68c350ebf6725e2804f73eba01bf'))


@doctor2 = Doctor.create!(name: 'Ellen Abel', specialization: 'eye specialist', available_times: 'monday-friday', hourly_rate: 250, picture: ('https://asset.cloudinary.com/dcphbr3ka/87e6862dcd2ddc1f58c293f7c999c534'))

@doctor3 = Doctor.create!(name: 'Girard Geoni', specialization: 'eye specialist', available_times: 'monday-friday', hourly_rate: 250, picture: ('https://asset.cloudinary.com/dcphbr3ka/6ca49db87b0e6d8ed3ba05f84cf43472'))

