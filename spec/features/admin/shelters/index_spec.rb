require 'rails_helper'
# rspec spec/features/admin/shelters/index_spec.rb
RSpec.describe 'Admin Shelter Index' do
  it 'sorts in reverse alpha' do
    shelter1 = Shelter.create!(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
    shelter2 = Shelter.create(name: 'Denver Shelter', city: 'Denver, CO', foster_program: true, rank: 7)

    visit '/admin/shelters'

    expect('Mystery Building').to appear_before('Denver Shelter')
  end
end
