FactoryBot.define do
  factory :repo do
    name {Faker::Name.name }
    link {Faker::Internet.url(host: 'github')}
  end 
end