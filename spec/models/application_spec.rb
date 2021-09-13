require 'rails_helper'
# rspec spec/models/application_spec.rb
RSpec.describe Application, type: :model do
  describe 'relationships' do
    it { should have_many(:application_pets) }
    it { should have_many(:pets).through(:application_pets) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zip) }
  end

  describe 'class methods' do
    describe '#order_by_recently_created' do
      it 'returns applications with the most recently created first' do
        application1 = Application.create!(name: 'Xtina', street: '3431 N Vine Street', city: 'Denver', state: 'Colorado', zip: '85523', description: 'this is a description', status: 'Pending', created_at: 'Fri, 10 Sep 2021 19:37:27 UTC +00:00,', updated_at: 'Fri, 10 Sep 2021 19:37:27 UTC +00:00,')
        application2 = Application.create!(name: 'Ozzie', street: '3431 N Vine Street', city: 'Denver', state: 'Colorado', zip: '85523', description: 'this is Ozzies description', status: 'In Progress', created_at: 'Sat, 11 Sep 2021 19:37:27 UTC +00:00,', updated_at: 'Sat, 11 Sep 2021 19:37:27 UTC +00:00,')


        expect(Application.order_by_recently_created).to eq([application2, application1])
      end
    end



  end
end
