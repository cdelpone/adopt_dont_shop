require 'rails_helper'
# rspec spec/features/admin/applications/show_spec.rb
RSpec.describe 'Admin Application Show Page' do
  describe 'Approving a Pet for Adoption' do
    it 'has a button next to each pet to approve' do
      shelter = Shelter.create(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
      shelter2 = Shelter.create(name: 'Denver Shelter', city: 'Denver, CO', foster_program: true, rank: 7)
      pet = shelter.pets.create(name: 'Scrappy', age: 1, breed: 'Great Dane', adoptable: true)
      # pet = Pet.create(name: 'Scrappy', age: 1, breed: 'Great Dane', adoptable: true, shelter_id: shelter.id)
      pet2 = shelter.pets.create(name: 'Pesto', age: 5, breed: 'Best Breed', adoptable: true)
      pet3 = shelter2.pets.create(name: 'Lucille Bald', breed: 'sphynx', age: 8, adoptable: true)
      pet4 = shelter.pets.create(name: 'Scooby', age: 5, breed: 'Great Dane', adoptable: true)
      application = Application.create(name: 'Xtina', street: '3431 N Vine Street', city: 'Denver', state: 'Colorado', zip: '85523', description: 'this is a description', status: 'Pending')
      application_pets = ApplicationPet.create!(pet_id: pet.id, application_id: application.id)
      application_pets = ApplicationPet.create!(pet_id: pet2.id, application_id: application.id)

      visit admin_application_path(application.id)

      expect(page).to have_button("Approve Pesto")
      expect(page).to have_button("Approve Scrappy")
    end

    it 'redirects to the show page and there is no button to approve the pet' do
      shelter = Shelter.create(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
      pet = shelter.pets.create(name: 'Scrappy', age: 1, breed: 'Great Dane', adoptable: true)
      pet2 = shelter.pets.create(name: 'Pesto', age: 5, breed: 'Best Breed', adoptable: true)
      application = Application.create(name: 'Xtina', street: '3431 N Vine Street', city: 'Denver', state: 'Colorado', zip: '85523', description: 'this is a description', status: 'Pending')
      application_pet1 = ApplicationPet.create!(pet_id: pet.id, application_id: application.id)
      application_pet2 = ApplicationPet.create!(pet_id: pet2.id, application_id: application.id)

      visit admin_application_path(application.id)

      click_button "Approve Pesto"

      expect(current_path).to eq(admin_application_path(application.id))

      application.reload

      expect(application_pets2.pet_status).to eq("Approved")
      expect(page).to have_no_content("Approve Pesto")
      expect(page).to have_no_content("Approve Scrappy")
      expect(page).to have_no_button("Approve Scrappy")
    end
  end

  xdescribe 'Rejecting a Pet for Adoption' do
    it 'has a button next to each pet to reject' do
      shelter = Shelter.create(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
      pet = Pet.create(name: 'Scrappy', age: 1, breed: 'Great Dane', adoptable: true, shelter_id: shelter.id)
      application = Application.create(name: 'Xtina', street: '3431 N Vine Street', city: 'Denver', state: 'Colorado', zip: '85523', description: 'this is a description', status: 'Pending')
      application_pets = ApplicationPet.create!(pet_id: pet.id, application_id: application.id)

      visit admin_application_path(application.id)

      expect(page).to have_button("Reject")
    end
  end
end
