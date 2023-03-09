require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Startup.destroy_all
Investor.destroy_all
User.destroy_all

User.create!(email: "vilmacatani@gmail.com", password: "111111", user_type: 'investor')
# User.create!(email: "martacatani@gmail.com", password: "111111", user_type: 'startup')

FUNDING = ["Seed", "Pre-Seed", "Series A", "Series B", "Series C"]
investor_type = ["Angel", "Venture Capital", "Private Equity Fund", "Bank"]
i = 1

2.times do
  user = User.create!(
    address: Faker::Address.full_address,
    email: "vilmacatani#{i}@gmail.com",
    password: "111111",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    company_name: Faker::Company.name,
    city: Faker::Address.city_suffix,
    country: Faker::Address.country,
    user_type: "investor"
  )

  Investor.create!(
    user_id: user.id,
    private: true,
    funding_type: FUNDING.sample,
    investor_type: investor_type.sample
  )
  i += 1
end
j = 1

5.times do
  user = User.create!(
    address: Faker::Address.full_address,
    email: "martasolenne#{j}@gmail.com",
    password: "111111",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    company_name: Faker::Company.name,
    city: Faker::Address.city_suffix,
    country: Faker::Address.country,
    user_type: "startup"
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
  j += 1
end
