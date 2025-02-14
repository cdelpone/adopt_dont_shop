require 'rails_helper'
# rspec spec/features/admin/applications/show_spec.rb
RSpec.describe 'Admin Application Show Page' do
  describe 'Approving a Pet for Adoption' do
    it 'has a button next to each pet to approve' do
      shelter = Shelter.create(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
      pet = Pet.create(name: 'Scrappy', age: 1, breed: 'Great Dane', adoptable: true, shelter_id: shelter.id)
      application = Application.create(name: 'Xtina', street: '3431 N Vine Street', city: 'Denver', state: 'Colorado', zip: '85523', description: 'this is a description', status: 'Pending')
      application_pets = ApplicationPet.create!(pet_id: pet.id, application_id: application.id)

      visit admin_application_path(application.id)

      expect(page).to have_button("Approve")
    end
  end

  describe 'Rejecting a Pet for Adoption' do
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
