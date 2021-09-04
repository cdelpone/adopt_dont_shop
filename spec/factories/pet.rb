FactoryBot.define do
  factory :pet do
    name {'Scooby'}
    age {2}
    breed {'Great Dane'}
    adoptable {true}
    shelter_id {shelter.id}
  end
end
