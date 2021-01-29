# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

(1..5).each do |id|
    User.create!(
        id: id, 
        name: Faker::Name.unique.name,
        password: "12345678", 
        password_confirmation: "12345678",
        role: %w[Admin User].sample 
    )
end

(1..20).each do |id|
    Account.create!(
        id: id,
        user_id: rand(1..5),
        name: Faker::Company.name, 
        address: Faker::Address.city
    )
end


(1..20).each do |id|
    Opportunity.create!(
        id: id,
        account_id: rand(1..20),
        amount: rand(20000..30000),
        name: Faker::Job.title,
        stage: ["Discovery", "Proposal Shared", "Negotiation"].sample
    )
end