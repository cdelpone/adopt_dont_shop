require 'rails_helper'
# rspec spec/features/admin/shelters/index_spec.rb
RSpec.describe 'Admin Shelter Index' do
  it 'sorts in reverse alpha' do
    shelter1 = Shelter.create(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
    shelter2 = Shelter.create(name: 'Denver Shelter', city: 'Denver, CO', foster_program: true, rank: 7)

    visit '/admin/shelters'

    expect('Mystery Building').to appear_before('Denver Shelter')
  end

  it 'has a section for shelters with pending applications' do
    shelter1 = Shelter.create(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
    shelter2 = Shelter.create(name: 'Denver Shelter', city: 'Denver, CO', foster_program: true, rank: 7)
    shelter3 = Shelter.create(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)

    pet1 = shelter1.pets.create(name: 'Scrappy', age: 1, breed: 'Great Dane', adoptable: true)
    pet2 = shelter1.pets.create(name: 'Pesto', age: 5, breed: 'Best Breed', adoptable: true)
    pet3 = shelter3.pets.create(name: 'Lucille Bald', breed: 'sphynx', age: 8, adoptable: true)
    pet4 = shelter1.pets.create(name: 'Scooby', age: 5, breed: 'Great Dane', adoptable: true)

    application1 = Application.create!(name: 'Xtina', street: '3431 N Vine Street', city: 'Denver', state: 'Colorado', zip: '85523', description: 'this is a description', status: 'Pending')
    application2 = Application.create!(name: 'Ozzie', street: '3431 N Vine Street', city: 'Denver', state: 'Colorado', zip: '85523', description: 'this is Ozzies description', status: 'In Progress')

    application_pets1 = ApplicationPet.create!(pet_id: pet1.id, application_id: application1.id)
    application_pets2 = ApplicationPet.create!(pet_id: pet3.id, application_id: application1.id)

    visit '/admin/shelters'

    within("#pending_apps") do
      expect(page).to have_content("Shelter's with Pending Applications")
      expect(page).to have_content('Mystery Building')
      expect(page).to have_content('Fancy pets of Colorado')
      expect(page).to have_no_content('Denver Shelter')
    end
  end
end
