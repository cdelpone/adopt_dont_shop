# As a visitor
# When I visit an applications show page
# Then I can see the following:
# Name of the Applicant
# Full Address of the Applicant including street address, city, state, and zip code
# Description of why the applicant says they'd be a good home for this pet(s)
# names of all pets that this application is for (all names of pets should be links to their show page)
# The Application's status, either "In Progress", "Pending", "Accepted", or "Rejected"
require 'rails_helper'
# rspec spec/features/applications/show_spec.rb
RSpec.describe 'applications show' do
  describe '#initialize' do
    it 'can see application ' do
      # can add a specific shelter here
      pet = create(:pet)
      application = create(:application)
      # can also do something like this => application = create(:application, name: 'Pesto')
      application_pet = ApplicationPet.create!(pet_id: pet.id, application_id: application.id)
      visit '/applications'
    end
  end
end
# this would create a list of 20 pets => create_list(:pet, 20)
