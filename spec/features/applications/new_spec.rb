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

    end

    it 'creates a new form with attributes' do

    end
  end
end
