require 'rails_helper'
# rspec spec/features/applications/new_spec.rb
RSpec.describe 'Start Application' do
  describe 'new application form submission' do
    # Starting an Application
    # visit the pet index page | see a link to "Start an Application" | click link | redirected to the new application page | see a form |  fill in this form with - Name, - Street Address, - City, - State, - Zip Code | click submit | redirected to the new application's show page | see my Name, address, and description | see an indicator that this application is "In Progress"
    it 'links from pet index' do
      visit '/pets'

      expect(page).to have_link('Start an Application')

      click_link 'Start an Application'

      expect(current_path).to eq(new_application_path)
    end

    it 'has a fillable form' do
      visit new_application_path

      fill_in 'Name', with: 'Melanie'
      fill_in 'Street', with: '1234 Alphabet Street'
      fill_in 'City', with: 'Denver'
      fill_in 'State', with: 'Colorado'
      fill_in 'Zip Code', with: '86004'
      fill_in 'Description of why I would make a good home', with: 'This is why I, Melanie, would make a great home'

      expect(page).to have_button("Submit Application")
    end

    it 'creates a new form with attributes' do
      visit new_application_path

      fill_in 'Name', with: 'Melanie'
      fill_in 'Street', with: '1234 Alphabet Street'
      fill_in 'City', with: 'Denver'
      fill_in 'State', with: 'Colorado'
      fill_in 'Zip Code', with: '86004'
      fill_in 'Description of why I would make a good home', with: 'This is why I, Melanie, would make a great home'

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

  describe 'throws error for incomplete forms' do
    # Starting an Application, Form not Completed
    # visit the new application page | fail to fill in any of the form fields | click submit | redirected back to the new applications page | see a message that I must fill in those fields.
    it 'redirects to form when form is incomplete' do
      visit new_application_path

      fill_in 'Name', with: 'Melanie'
      fill_in 'Street', with: '1234 Alphabet Street'
      fill_in 'City', with: 'Denver'
      fill_in 'Zip Code', with: '86004'
      fill_in 'Description of why I would make a good home', with: 'This is why I, Melanie, would make a great home'

      click_button "Submit Application"

      expect(current_path).to eq(new_application_path)

      expect(page).to have_content('Incomplete form, please complete required fields')
    end

    it 'displays an incomplete form error' do

    end
  end

end
