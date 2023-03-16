require 'faker'

Meeting.destroy_all
Connection.destroy_all
Member.destroy_all
Startup.destroy_all
Investor.destroy_all
User.destroy_all

images = [Image::DELIVERY, Image::HEALTHTECH, Image::AI, Image::EDTECH, Image::FINTECH, Image::MOBILITY,
  Image::SUPPLYCHAIN, Image::REALESTATE, Image::ECOMMERCE, Image::BIGDATA, Image::BLOCKCHAIN, Image::B2B, Image::RETAIL]

vilmasimg = [Image::EDTECH, Image::HEALTHTECH]
puts vilmasimg.class
vilma = User.create!(
  email: "vilmacatani@gmail.com",
  password: "111111",
  user_type: 'investor',
  first_name: "Vilma",
  last_name: "Catani",
  address: "Amsterdam",
  city: "Amsterdam",
  country: "Netherlands",
  company_name: "VMC Ventures Oy"
)

Investor.create!(
  user_id: vilma.id,
  private: false,
  funding_type: "Seed",
  investor_type: "Angel Investor"
)
# Get id of our main investor vilma
investor_vilma = vilma.id
pending = [true, false]
accepted = [true, false]
technologies = ["Education Technology", "Healthcare Technology"]
# Demo data

h = 0
m = 0
technologies.each do |tech|
  puts h
  limit = 5
  data = CrunchbaseApi.organization_summary(tech, limit)
  data["entities"].each do |company|
    user = User.create!(
      email: "maria.massano#{m}@gmail.com",
      password: "111111",
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      user_type: "startup",
      country: "Portugal",
      company_name: company["identifier"]["value"]
    )
    puts "Users created"
    Startup.create!(
      user_id: user.id,
      industry: tech,
      funding_amount: Faker::Number.between(from: 60, to: 100),
      funding_round_end_date: Faker::Date.between(from: '2023-01-01', to: '2024-12-31'),
      funding: "Seed",
      team: Faker::Number.between(from: 1, to: 4),
      bio: "#{company["short_description"]}. #{user.company_name} is a #{tech} startup has created revolutionizing
      innovation. Our mission is to become leading #{tech.downcase } company, and we believe that we can make a
      significant difference in market by our unique selling proposition.
      Our team is comprised of experienced professionals and passionate individuals. We're excited to be on this journey,
      and we invite you to join us as we build a better #{tech.downcase} for all.",
      headcount: Faker::Number.between(from: 1, to: 15),
      turnover: Faker::Number.between(from: 1, to: 10),
      raised_amount: Faker::Number.between(from: 1, to: 75),
      img: vilmasimg[h].sample
    )
    m+=1
    puts 'end'
  end
  puts "Startups created"
  Startup.all.each do |sup|
    4.times do
      Member.create!(
        startup_id: sup.id,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        bio: Faker::Company.catch_phrase,
        position: ["CEO", "CTO", "Founder", "Co-Founder"].sample
      )
    end
  end
  puts "members created"
  h += 1
end

startups = Startup.all
array = (0..startups.length - 1).to_a

2.times do
  i = array.sample
  startup = startups[i]
  messages = ["Hi #{startup.user.first_name}, very interesting company let's connect",
    "Hello #{startup.user.first_name}, let's connect!",
    "Hi, we are looking for #{startup.industry} driven startups and your idea seems great. Let's have a chat! Greetings, #{vilma.first_name}"]

  connection_sent = Connection.create!(
    message: messages.sample,
    pending: pending.sample,
    accepted: accepted.sample,
    receiver_id: startup.user.id,
    sender_id: investor_vilma
  )
  date = Faker::Date.forward(days: 35)
  time = rand(8...16)
  min = [30, 45, 60].sample
  starting_time = DateTime.new(date.year, date.month, date.day, time, 0, 0)
  ending_time = DateTime.new(date.year, date.month, date.day, time, 0, 0) + min.minute
  company = User.where(id: connection_sent.receiver_id)

  if connection_sent.pending == false && connection_sent.accepted == true
    Meeting.create!(
      connection_id: connection_sent.id,
      start_time: starting_time,
      end_time: ending_time,
      duration: min,
      title: "Intro with #{company.first.company_name}",
      meeting_pending: pending.sample,
      meeting_accepted: accepted.sample
    )
  end
  # startup.members.destroy_all
  array.delete(i)
  puts "we are done with sent"
end

3.times do
  j = array.sample
  startup = startups[j]
  messages = ["Hi #{vilma.first_name}, we are looking for seed funding let's connect",
    "Hello #{vilma.first_name}, let's connect!",
    "Hi, we are looking for #{vilma.first_name} I see you are looking for #{technologies.sample} driven startups. Let's have a chat so we can present our company!"]

  connection_sent = Connection.create!(
    message: messages.sample,
    pending: pending.sample,
    accepted: accepted.sample,
    receiver_id: investor_vilma,
    sender_id: startup.user.id
  )
  date = Faker::Date.forward(days: 35)
  time = rand(8...16)
  min = [30, 45, 60].sample
  starting_time = DateTime.new(date.year, date.month, date.day, time, 0, 0)
  ending_time = DateTime.new(date.year, date.month, date.day, time, 0, 0) + min.minute
  company = User.where(id: connection_sent.receiver_id)

  if connection_sent.pending == false && connection_sent.accepted == true
    Meeting.create!(
      connection_id: connection_sent.id,
      start_time: starting_time,
      end_time: ending_time,
      duration: min,
      title: "Intro with #{company.first.company_name}",
      meeting_pending: pending.sample,
      meeting_accepted: accepted.sample
    )
  end
  # startup.members.destroy_all
  array.delete(j)
  puts "we are done with received"
end

#-------------------------------------------------------------------------------------------------------------------------

# Create Startups
j = 0
n = 0
Startup::INDUSTRIES.each do |s|
  limit = 4
  data = CrunchbaseApi.organization_summary(s, limit)

  data["entities"].each do |company|
    user = User.create!(
      email: "marta#{n}@gmail.com",
      password: "111111",
      first_name: "Marta",
      last_name: "Maria",
      user_type: "startup",
      address: "London",
      city: "London",
      country: "UK",
      company_name: company["identifier"]["value"]
    )

    Startup.create!(
      user_id: user.id,
      industry: s,
      funding_amount: Faker::Number.between(from: 60, to: 100),
      funding_round_end_date: Faker::Date.between(from: '2023-01-01', to: '2024-12-31'),
      funding: Investor::FUNDINGS.sample,
      team: Faker::Number.between(from: 1, to: 10),
      bio: company["short_description"],
      headcount: Faker::Number.between(from: 1, to: 500),
      turnover: Faker::Number.between(from: 1, to: 200),
      raised_amount: Faker::Number.between(from: 1, to: 55),
      img: images[j].sample
    )
    n+=1
  end
  j += 1
end

k = 1
Investor::INVESTORS.each do |i|
  limit = 4
  data = CrunchbaseApi.organization_summary(i, limit)
  data["entities"].each do |company|
    user = User.create!(
      email: "vilma#{k}@gmail.com",
      password: "111111",
      first_name: "Vilma",
      last_name: "Aurela",
      user_type: "investor",
      address: "Paris",
      city: "Paris",
      country: "France",
      company_name: company["identifier"]["value"]
    )

    Investor.create!(
      user_id: user.id,
      private: [false, true].sample,
      funding_type: Investor::FUNDINGS.sample,
      investor_type: i
    )
    k += 1
  end
end
puts "Create more members"
Startup.all.each do |startup|
  4.times do
    Member.create!(
      startup: startup,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      bio: Faker::Company.catch_phrase,
      position: ["CEO", "CTO", "Founder", "Co-Founder"].sample
    )
  end
end

2.times do
  Connection.create!(
    message: "Hello, interesting company",
    pending: true,
    accepted: false,
    receiver_id: Investor.all.sample.user_id,
    sender_id: Startup.all.sample.user.id
  )
end
puts "Create more connections"
# 3.times do
#   Connection.create!(
#     message: "Hi let's connect!",
#     pending: true,
#     accepted: false,
#     receiver_id: Startup.all.sample.user.id,
#     sender_id: investor_vilma
#   )
# end

6.times do
  Connection.create!(
    message: "Hi let's connect!",
    pending: true,
    accepted: false,
    receiver_id: investor_vilma,
    sender_id: Startup.all.sample.user.id
  )
end

3.times do
  connection = Connection.create!(
    message: "Hello let's connect",
    pending: false,
    accepted: true,
    receiver_id: investor_vilma,
    sender_id: Startup.all.sample.user.id
  )
  date = Faker::Date.forward(days: 10)
  time = rand(8...16)
  min = [30, 45, 60].sample
  starting_time = DateTime.new(date.year, date.month, date.day, time, 0, 0)
  ending_time = DateTime.new(date.year, date.month, date.day, time, 0, 0) + min.minute
  company = User.where(id: connection.receiver_id)

  Meeting.create!(
    connection_id: connection.id,
    start_time: starting_time,
    end_time: ending_time,
    duration: min,
    title: "Intro with #{company.first.company_name}",
    meeting_pending: false,
    meeting_accepted: true
  )
end


#----------------------------------------------------------------------------------

# DONT COMMENT THIS IN ANYMORE
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
