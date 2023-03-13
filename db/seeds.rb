require 'faker'

Startup.destroy_all
Investor.destroy_all
User.destroy_all

User.create!(email: "vilmacatani@gmail.com", password: "111111", user_type: 'investor')

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
