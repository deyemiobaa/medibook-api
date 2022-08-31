# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# User.create!(username:  "Example User", password: "password", password_confirmation: "password")

@doctor1 = Doctor.create!(name: 'Dr. Khadijah Zaima', specialization: 'eye specialist', available_times: 'monday-friday', hourly_rate: 250, picture: ('https://res.cloudinary.com/deyemiobaa/image/upload/v1661971456/medi-book/khadijah-zaima.jpg'))

@doctor3 = Doctor.create!(name: 'Dr. Katherine Powells', specialization: 'Opthamology', available_times: 'Monday, Friday, and Saturday', hourly_rate: 250, picture: ('https://res.cloudinary.com/deyemiobaa/image/upload/v1661971056/medi-book/katherine-powells-1n.jpg'))

@doctor2 = Doctor.create!(name: 'Dr. Isaac Collins', specialization: 'Therapy', available_times: 'Monday - Friday', hourly_rate: 150, picture: ('https://res.cloudinary.com/deyemiobaa/image/upload/v1661970752/medi-book/isaac-w-collins-1_kwuihq.jpg'))

