require 'rails_helper'
# rspec spec/models/application_spec.rb
RSpec.describe Application, type: :model do
  describe 'relationships' do
    it { should have_many :application_pets }
  end
end
  #
  # describe 'validations' do
  #   it { should validate_presence_of(:name) }
  #   it { should validate_presence_of(:age) }
  #   it { should validate_numericality_of(:age) }
  # end
