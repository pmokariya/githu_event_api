FactoryBot.define do
  factory :event do
    event_type {Faker::Name.name }
    public {Faker::Boolean.boolean}
    repo_id {create(:repo).id }
    actor_id {create(:actor).id}
  end 
end