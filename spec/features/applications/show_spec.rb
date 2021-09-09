require 'rails_helper'
# rspec spec/features/applications/show_spec.rb
RSpec.describe 'Application Show Page' do
  describe 'Application Show Page' do
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

  describe 'Searching for Pets for an Application' do
    it 'shows section for add pet to application' do
      shelter = Shelter.create!(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
      pet = Pet.create!(name: 'Scrappy', age: 1, breed: 'Great Dane', adoptable: true, shelter_id: shelter.id)
      application = Application.create!(name: 'Xtina', street: '3431 N Vine Street', city: 'Denver', state: 'Colorado', zip: '85523', description: 'this is a description')

      visit application_path(application)
      # save_and_open_page
      expect(page).to have_content("In Progress")
      expect(page).to have_content("Add a Pet to this Application")
      expect(page).to have_content("Search")
      expect(page).to have_button("Search")

      expect(page).to have_no_content("Pending")
      expect(page).to have_no_content("Accepted")
      expect(page).to have_no_content("Rejected")

      fill_in 'Search', with: 'Scrap'
      click_button 'Search'
      expect(page).to have_content('Scrappy')
    end

    it 'doesnt show section for add pet to application if app is pending' do
      shelter = Shelter.create!(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
      pet = Pet.create!(name: 'Scrappy', age: 1, breed: 'Great Dane', adoptable: true, shelter_id: shelter.id)
      application = Application.create!(name: 'Xtina', street: '3431 N Vine Street', city: 'Denver', state: 'Colorado', zip: '85523', description: 'this is a description', status: 'Pending')

      visit application_path(application)

      expect(page).to have_content("Pending")
      expect(page).to have_no_content("Add a Pet to this Application")
      expect(page).to have_no_button("Search")
    end
  end

  describe 'Add a Pet to an Application' do
    it 'has a button to add pet to application' do
      shelter = Shelter.create!(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
      pet = Pet.create!(name: 'Scrappy', age: 1, breed: 'Great Dane', adoptable: true, shelter_id: shelter.id)
      application = Application.create!(name: 'Xtina', street: '3431 N Vine Street', city: 'Denver', state: 'Colorado', zip: '85523', description: 'this is a description')
      application_pets = ApplicationPet.create!(pet_id: pet.id, application_id: application.id)
      # application.pets << pet
      # pet.applications << application

      visit application_path(application)
      fill_in 'Search', with: 'Scrap'
      click_button 'Search'
      expect(page).to have_content('Scrappy')
      expect(page).to have_button("Adopt this Pet")
      expect(current_path).to eq(application_path(application))
      expect(application.pets).to eq([pet])
    end
  end

  describe 'Submit an Application' do
    it 'has a button to submit an application' do
      shelter = Shelter.create!(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
      pet = Pet.create!(name: 'Scrappy', age: 1, breed: 'Great Dane', adoptable: true, shelter_id: shelter.id)
      application = Application.create!(name: 'Xtina', street: '3431 N Vine Street', city: 'Denver', state: 'Colorado', zip: '85523', description: 'this is a description')
      application_pets = ApplicationPet.create!(pet_id: pet.id, application_id: application.id)

      visit application_path(application)
      fill_in 'Search', with: 'Scrap'
      click_button 'Search'
      expect(page).to have_content('Scrappy')
      expect(page).to have_button("Adopt this Pet")
      expect(current_path).to eq(application_path(application))
      expect(application.pets).to eq([pet])

      expect(page).to have_content("Submitting an Application")
      expect(page).to have_content("Please provide a brief description of why you would make a good owner for these pet(s)")
      fill_in "Please provide a brief description of why you would make a good owner for these pet(s)", with: 'This is why Scrappy will love me!'
      click_button "Submit Application"
    end

    it 'app status changes to pending and cant add more pets after submitting an application ' do
      shelter = Shelter.create!(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
      pet = Pet.create!(name: 'Scrappy', age: 1, breed: 'Great Dane', adoptable: true, shelter_id: shelter.id)
      application = Application.create!(name: 'Xtina', street: '3431 N Vine Street', city: 'Denver', state: 'Colorado', zip: '85523', description: 'this is a description')
      application_pets = ApplicationPet.create!(pet_id: pet.id, application_id: application.id)

      visit application_path(application)
      fill_in 'Search', with: 'Scrap'
      click_button 'Search'
      expect(page).to have_content('Scrappy')
      expect(page).to have_button("Adopt this Pet")
      expect(current_path).to eq(application_path(application))
      expect(application.pets).to eq([pet])

      expect(page).to have_content("Submitting an Application")
      expect(page).to have_content("Please provide a brief description of why you would make a good owner for these pet(s)")
      fill_in "Please provide a brief description of why you would make a good owner for these pet(s)", with: 'This is why Scrappy will love me!'
      click_button "Submit Application"
      # saves application state, reload updates app state
      application.reload

      expect(current_path).to eq(application_path(application))
      expect(application.status).to eq("Pending")

      expect(page).to have_content("Pending")
      expect(page).to have_no_content("In Progress")

      expect(page).to have_no_content("Add a Pet to this Application")
      expect(page).to have_no_content("Search")
      expect(page).to have_no_button("Search")
    end
  end

  describe 'No Pets on an Application' do
    it 'doesnt have a button to submit an application' do
      shelter = Shelter.create!(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
      pet = Pet.create!(name: 'Scrappy', age: 1, breed: 'Great Dane', adoptable: true, shelter_id: shelter.id)
      application = Application.create!(name: 'Xtina', street: '3431 N Vine Street', city: 'Denver', state: 'Colorado', zip: '85523', description: 'this is a description')

      visit application_path(application)
      expect(application.pets).to eq([])

      expect(page).to have_no_content("Submitting an Application")
      expect(page).to have_no_button("Submit Application")
    end
  end
end
