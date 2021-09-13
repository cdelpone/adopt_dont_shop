require 'rails_helper'
# rspec spec/features/admin/applications/index_spec.rb
RSpec.describe 'Admin Application Index' do
  it 'shows all applications ordered by created at' do
    shelter1 = Shelter.create(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
    shelter2 = Shelter.create(name: 'Denver Shelter', city: 'Denver, CO', foster_program: true, rank: 7)

    pet1 = shelter1.pets.create(name: 'Scrappy', age: 1, breed: 'Great Dane', adoptable: true)
    pet2 = shelter1.pets.create(name: 'Pesto', age: 5, breed: 'Best Breed', adoptable: true)
    pet3 = shelter2.pets.create(name: 'Lucille Bald', breed: 'sphynx', age: 8, adoptable: true)
    pet4 = shelter2.pets.create(name: 'Scooby', age: 5, breed: 'Great Dane', adoptable: true)

    application1 = Application.create!(name: 'Xtina', street: '3431 N Vine Street', city: 'Denver', state: 'Colorado', zip: '85523', description: 'this is a description', status: 'Pending', created_at: 'Fri, 10 Sep 2021 19:37:27 UTC +00:00,')
    application2 = Application.create!(name: 'Ozzie', street: '3431 N Vine Street', city: 'Denver', state: 'Colorado', zip: '85523', description: 'this is Ozzies description', status: 'In Progress', created_at: 'Sat, 11 Sep 2021 19:37:27 UTC +00:00,')

    application_pets1 = ApplicationPet.create!(pet_id: pet1.id, application_id: application1.id)
    application_pets1 = ApplicationPet.create!(pet_id: pet2.id, application_id: application1.id)
    application_pets2 = ApplicationPet.create!(pet_id: pet3.id, application_id: application2.id)
    application_pets2 = ApplicationPet.create!(pet_id: pet4.id, application_id: application2.id)
    require "pry"; binding.pry

    visit admin_applications_path
    save_and_open_page

    expect(application1.name).to appear_before(application2.name)

    # within("#pending_apps") do
    #   expect(page).to have_content("Shelter's with Pending Applications")
    #   expect(page).to have_content('Mystery Building')
    #   expect(page).to have_content('Fancy pets of Colorado')
    #   expect(page).to have_no_content('Denver Shelter')
    # end
  end
end
