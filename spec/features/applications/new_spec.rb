# Starting an Application
# visit the pet index page | see a link to "Start an Application" | click link | redirected to the new application page | see a form |  fill in this form with - Name, - Street Address, - City, - State, - Zip Code
# click submit | redirected to the new application's show page
# see my Name, address information, and description of why I would make a good home
# see an indicator that this application is "In Progress"

require 'rails_helper'
# rspec spec/features/applications/new_spec.rb
RSpec.describe 'Start Application' do
  describe 'application form' do
    it 'links from pet index' do
      visit '/pets'

      expect(page).to have_link('Start an Application')

      click_link 'Start an Application'

      expect(current_path).to eq(new_application_path)
    end

    it 'has a fillable form' do
      visit new_application_path

      fill_in 'Name:', with: 'Melanie'
      fill_in 'Street Address:', with: '1234 Alphabet Street'
      fill_in 'City:', with: 'Denver'
      fill_in 'State:', with: 'Colorado'
      fill_in 'Zip Code:', with: '86004'
      fill_in 'Description of why I would make a good home:', with: 'This is why I, Melanie, would make a great home'

      expect(page).to have_button("Submit Application")
    end

    it 'creates a new form with attributes' do
      visit new_application_path

      fill_in 'Name:', with: 'Melanie'
      fill_in 'Street Address:', with: '1234 Alphabet Street'
      fill_in 'City:', with: 'Denver'
      fill_in 'State:', with: 'Colorado'
      fill_in 'Zip Code:', with: '86004'
      fill_in 'Description of why I would make a good home:', with: 'This is why I, Melanie, would make a great home'

      expect(page).to have_button("Submit Application")

      click_button "Submit Application"

      expect(current_path).to eq(application_path(Application.last.id))
      save_and_open_page

      expect(page).to have_content('Melanie')
      expect(page).to have_content('1234 Alphabet Street')
      expect(page).to have_content('This is why I, Melanie, would make a great home')
      expect(page).to have_content("In Progress")
    end
  end
end
