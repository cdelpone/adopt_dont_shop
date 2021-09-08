require 'rails_helper'
# rspec spec/features/admin/shelters/index_spec.rb
RSpec.describe 'Admin Shelter Index' do
  it 'sorts in reverse alpha' do
    shelter1 = Shelter.create!(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
    shelter2 = Shelter.create(name: 'Denver Shelter', city: 'Denver, CO', foster_program: true, rank: 7)

    visit '/admin/shelters'

    expect('Mystery Building').to appear_before('Denver Shelter')
  end

  it 'has a section for shelters with pending applications' do
    shelter1 = Shelter.create!(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
    pet1 = shelter1.pets.create(name: 'Scrappy', age: 1, breed: 'Great Dane', adoptable: true)
    pet2 = shelter1.pets.create(name: 'Pesto', age: 5, breed: 'Best Breed', adoptable: true)

    shelter2 = Shelter.create(name: 'Denver Shelter', city: 'Denver, CO', foster_program: true, rank: 7)
    pet4 = shelter2.pets.create(name: 'Scooby', age: 5, breed: 'Great Dane', adoptable: true)

    visit '/admin/shelters'
require "pry"; binding.pry
    expect('Mystery Building').to appear_before('Denver Shelter')
  end
end
