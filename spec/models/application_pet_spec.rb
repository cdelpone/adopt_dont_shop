require 'rails_helper'
# rspec spec/models/application_pet_spec.rb
RSpec.describe ApplicationPet, type: :model do
  describe 'relationships' do
    it { should belong_to(:application) }
    it { should belong_to(:pet) }
  end
end
