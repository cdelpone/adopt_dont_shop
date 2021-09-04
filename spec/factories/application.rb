FactoryBot.define do
  factory :application do
    # name {'Pesto'}
    name { Faker::Name.first_name }
    address { Faker::Address.street_address }
    address { Faker::Address.city }
    address { Faker::Address.state }
    address { Faker::Address.zip }
  end
end
# Faker::Name.name             #=> "Tyshawn Johns Sr."
# Faker::Name.name_with_middle #=> "Aditya Elton Douglas"
# Faker::Name.first_name       #=> "Kaci"
# Faker::Name.middle_name      #=> "Abraham"
# Faker::Name.male_first_name   #=> "Edward"
# Faker::Name.female_first_name #=> "Natasha"
# Faker::Name.last_name        #=> "Ernser"
# Faker::Name.prefix           #=> "Mr."
# Faker::Name.suffix           #=> "IV"
# # Keyword arguments: number
# Faker::Name.initials            #=> "NJM"
# Faker::Name.initials(number: 2) #=> "NM"
