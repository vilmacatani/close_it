require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Connection.destroy_all
User.destroy_all

funding = ["Seed", "Pre-Seed", "Series A", "Series B", "Series C"]
5.times do
  user = User.create!(
    address: Faker::Address.full_address,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    company_name: Faker::Company.name,
    city: Faker::Address.city_suffix,
    country: Faker::Address.country,
    user_type: "investor",
    email: Faker::Internet.email,
    password: "111111"
  )

  Investor.create!(
    user_id: user.id,
    private: true,
    funding_type: funding.sample,
    investor_type: Faker::Company.buzzword
  )
end


5.times do
  user = User.create!(
    address: Faker::Address.full_address,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    company_name: Faker::Company.name,
    city: Faker::Address.city_suffix,
    country: Faker::Address.country,
    user_type: "startup",
    email: Faker::Internet.email,
    password: "111111"
  )

  Startup.create!(
    user_id: user.id,
    funding_amount: Faker::Number.between(from: 1, to: 10),
    funding_round_end_date: Faker::Date.between(from: '2023-01-01', to: '2024-12-31'),
    funding: funding.sample,
    team: Faker::Number.between(from: 1, to: 10),
    industry: Faker::Company.industry,
    headcount: Faker::Number.between(from: 1, to: 500),
    turnover: Faker::Number.between(from: 1, to: 200)
  )
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
    last_name:  Faker::Name.last_name,
    bio: Faker::Company.industry,
    position: Faker::Company.bs
  )
end
