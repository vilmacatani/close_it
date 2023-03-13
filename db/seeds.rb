require 'faker'

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

Startup.destroy_all
Investor.destroy_all
User.destroy_all

User.create!(email: "vilmacatani@gmail.com", password: "111111", user_type: 'investor')
User.create!(email: "martacatani@gmail.com", password: "111111", user_type: 'startup')

FUNDING = ["Seed", "Pre-Seed", "Series A", "Series B", "Series C"]
user_type = ["investor", "startup"]
investor_type = ["Angel", "Venture Capital", "Private Equity Fund", "Bank"]



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

    user_type: "investor"

    user_type: user_type.sample

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
    user_type: "startup"
    user_type: user_type.sample
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

  j += 1

# Create Startups
j = 1
Startup::INDUSTRIES.each do |s|
  data = CrunchbaseApi.organization_summary(s)
  data["entities"].each do |company|
    user = User.create!(
      email: "marta#{j}@gmail.com",
      password: "111111",
      first_name: "Marta",
      last_name: "Maria",
      user_type: "startup",
      country: Country::COUNTRIES.sample,
      company_name: company["identifier"]["value"]
    )

    Startup.create!(
      user_id: user.id,
      industry: s,
      funding_amount: Faker::Number.between(from: 1, to: 10),
      funding_round_end_date: Faker::Date.between(from: '2023-01-01', to: '2024-12-31'),
      funding: Investor::FUNDINGS.sample,
      team: Faker::Number.between(from: 1, to: 10),
      bio: company["short_description"],
      headcount: Faker::Number.between(from: 1, to: 500),
      turnover: Faker::Number.between(from: 1, to: 200)
    )

    j += 1

  end

end

k = 1
Investor::INVESTORS.each do |i|
  data = CrunchbaseApi.organization_summary(i)
  data["entities"].each do |company|
    user = User.create!(
      email: "vilma#{k}@gmail.com",
      password: "111111",
      first_name: "Vilma",
      last_name: "Aurela",
      user_type: "investor",
      country: Country::COUNTRIES.sample,
      company_name: company["identifier"]["value"]
    )
    Investor.create!(
      user_id: user.id,
      private: false,
      funding_type: Investor::FUNDINGS.sample,
      investor_type: i
    )
    k += 1
  end

end


# j = 1
# 5.times do
#   user = User.create!(
#     address: Faker::Address.full_address,
#     email: "martasolenne#{j}@gmail.com",
#     password: "111111",
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     company_name: Faker::Company.name,
#     city: Faker::Address.city_suffix,
#     country: Faker::Address.country,
#     user_type: "startup"
#   )

#   Startup.create!(
#     user_id: user.id,
#     funding_amount: Faker::Number.between(from: 1, to: 10),
#     funding_round_end_date: Faker::Date.between(from: '2023-01-01', to: '2024-12-31'),
#     funding: FUNDING.sample,
#     team: Faker::Number.between(from: 1, to: 10),
#     industry: Faker::Company.industry,
#     headcount: Faker::Number.between(from: 1, to: 500),
#     turnover: Faker::Number.between(from: 1, to: 200)
#   )
#   j += 1

# end

# i = 1

# 2.times do
#   user = User.create!(
#     address: Faker::Address.full_address,
#     email: "vilmacatani#{i}@gmail.com",
#     password: "111111",
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     company_name: Faker::Company.name,
#     city: Faker::Address.city_suffix,
#     country: Faker::Address.country,
#     user_type: "investor"
#   )

#   Investor.create!(
#     user_id: user.id,
#     private: true,
#     funding_type: FUNDING.sample,
#     investor_type: investor_type.sample
#   )
#   i += 1
# end
# j = 1

# 5.times do
#   user = User.create!(
#     address: Faker::Address.full_address,
#     email: "martasolenne#{j}@gmail.com",
#     password: "111111",
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     company_name: Faker::Company.name,
#     city: Faker::Address.city_suffix,
#     country: Faker::Address.country,
#     user_type: "startup"
#   )

#   Startup.create!(
#     user_id: user.id,
#     funding_amount: Faker::Number.between(from: 1, to: 10),
#     funding_round_end_date: Faker::Date.between(from: '2023-01-01', to: '2024-12-31'),
#     funding: FUNDING.sample,
#     team: Faker::Number.between(from: 1, to: 10),
#     industry: Faker::Company.industry,
#     headcount: Faker::Number.between(from: 1, to: 500),
#     turnover: Faker::Number.between(from: 1, to: 200)
#   )
#   j += 1
# end
