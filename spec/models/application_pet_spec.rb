require 'rails_helper'
# rspec spec/models/application_pet_spec.rb
RSpec.describe ApplicationPet, type: :model do
  describe 'relationships' do
    it { should belong_to(:application) }
    it { should belong_to(:pet) }
  end

  describe 'validations' do
    it { should validate_presence_of(:application_id) }
    it { should validate_presence_of(:pet_id) }
  end
end
