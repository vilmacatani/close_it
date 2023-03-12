require 'faker'
<<<<<<< HEAD
Connection.destroy_all
User.destroy_all

funding = ["Seed", "Pre-Seed", "Series A", "Series B", "Series C"]

=======
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
>>>>>>> 0e16ded05713a1f10347f10c51d2a962cb0b5612
Startup.destroy_all
Investor.destroy_all
User.destroy_all

User.create!(email: "vilmacatani@gmail.com", password: "111111", user_type: 'investor')
User.create!(email: "martacatani@gmail.com", password: "111111", user_type: 'startup')

FUNDING = ["Seed", "Pre-Seed", "Series A", "Series B", "Series C"]
user_type = ["investor", "startup"]
investor_type = ["Angel", "Venture Capital", "Private Equity Fund", "Bank"]
<<<<<<< HEAD

=======
>>>>>>> 0e16ded05713a1f10347f10c51d2a962cb0b5612
i = 1

7.times do
  i +=1
  user = User.create!(
    address: Faker::Address.full_address,
    email: "vilmacatani#{i}@gmail.com",
    password: "111111",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    company_name: Faker::Company.name,
    city: Faker::Address.city_suffix,
    country: Faker::Address.country,
<<<<<<< HEAD
    user_type: "investor"
=======
    user_type: user_type.sample
>>>>>>> 0e16ded05713a1f10347f10c51d2a962cb0b5612
  )

  Investor.create!(
    user_id: user.id,
    private: true,
    funding_type: FUNDING.sample,
    investor_type: investor_type.sample
  )
<<<<<<< HEAD
=======
  i += 1
end
j = 1
>>>>>>> 0e16ded05713a1f10347f10c51d2a962cb0b5612

end
j = 1
7.times do
  j += 1
  user = User.create!(
    address: Faker::Address.full_address,
    email: "martasolenne#{j}@gmail.com",
    password: "111111",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    company_name: Faker::Company.name,
    city: Faker::Address.city_suffix,
    country: Faker::Address.country,
<<<<<<< HEAD
    user_type: "startup"
=======
    user_type: user_type.sample
>>>>>>> 0e16ded05713a1f10347f10c51d2a962cb0b5612
  )

  Startup.create!(
    user_id: user.id,
    funding_amount: Faker::Number.between(from: 1, to: 10),
    funding_round_end_date: Faker::Date.between(from: '2023-01-01', to: '2024-12-31'),
    funding: FUNDING.sample,
    team: Faker::Number.between(from: 1, to: 10),
    industry: Faker::Company.industry,
    headcount: Faker::Number.between(from: 1, to: 500),
    turnover: Faker::Number.between(from: 1, to: 200)
  )
<<<<<<< HEAD

end

user_ids = User.all.pluck(:id)

5.times do
  connection = Connection.create!(
    pending: true,
    accepted: true,
    message: Faker::Quote.matz,
    sender_id: user_ids.sample,
    receiver_id: user_ids.sample,
    connection_type: "hello"
  )

  Meeting.create!(
    meeting_time: DateTime.new,
    connection_id: connection.id,
    meeting_accepted: true,
    meeting_pending: true
  )
end

startup_ids = Startup.all.pluck(:id)

6.times do
  Member.create!(
    startup_id: startup_ids.sample,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    bio: Faker::Company.industry,
    position: Faker::Company.bs
  )
=======
  j += 1
>>>>>>> 0e16ded05713a1f10347f10c51d2a962cb0b5612
end
