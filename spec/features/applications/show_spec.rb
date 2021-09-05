require 'rails_helper'
# rspec spec/features/applications/show_spec.rb
RSpec.describe 'application show' do
  describe 'application show page' do
    # As a visitor
    # When I visit an applications show page
    # Then I can see the following:
    # Name of the Applicant
    # Full Address of the Applicant including street address, city, state, and zip code
    # Description of why the applicant says they'd be a good home for this pet(s)
    # names of all pets that this application is for (all names of pets should be links to their show page)
    # The Application's status, either "In Progress", "Pending", "Accepted", or "Rejected"
    it 'can see application fillable fields' do
      # can add a specific shelter here
      # pet = create(:pet)
      # this would create a list of 20 pets => create_list(:pet, 20)
      # application = create(:application)
      # can also do something like this => application = create(:application, name: 'Pesto')
      # application_pet = ApplicationPet.create!(pet_id: pet.id, application_id: application.id)
      shelter = Shelter.create!(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
      pet = Pet.create!(name: 'Scrappy', age: 1, breed: 'Great Dane', adoptable: true, shelter_id: shelter.id)
      application = Application.create!(name: 'Xtina', street: '3431 N Vine Street', city: 'Denver', state: 'Colorado', zip: '85523', description: 'this is a description')

      visit application_path(application)

      expect(page).to have_content(application.name)
      expect(page).to have_content(application.street)
      expect(page).to have_content(application.state)
      expect(page).to have_content(application.zip)
      expect(page).to have_content(application.description)
      expect(page).to have_content(application.status)
    end
  end

  describe 'application show page' do
    # Searching for Pets for an Application
    # visit an application's show page | And that application has not been submitted | see a section on the page to "Add a Pet to this Application"
    # In that section I see an input where I can search for Pets by name
    # fill in this field with a Pet's name | click submit | redirected to the application show page
    # And under the search bar I see any Pet whose name matches my search
    it 'shows section for add pet to application' do
      shelter = Shelter.create!(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
      pet = Pet.create!(name: 'Scrappy', age: 1, breed: 'Great Dane', adoptable: true, shelter_id: shelter.id)
      application = Application.create!(name: 'Xtina', street: '3431 N Vine Street', city: 'Denver', state: 'Colorado', zip: '85523', description: 'this is a description')

      visit application_path(application)

      expect(page).to have_content("Add a Pet to this Application")
      expect(page).to have_content("In Progress")
      expect(page).to have_content("Search")
      expect(page).to have_button("Search")

      fill_in 'Search', with: 'Scrap'
      click_button 'Search'

      expect(page).to have_content('Scrappy')
    end
  end

end
