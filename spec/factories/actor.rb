FactoryBot.define do
  factory :actor do
    name {Faker::Name.name }
    email {Faker::Internet.email}
  end 
end