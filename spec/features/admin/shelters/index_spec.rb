require 'rails_helper'
# rspec spec/features/admin/shelters/index_spec.rb
RSpec.describe 'Admin Shelter Index' do
  it 'sorts in reverse alpha' do
    # SQL Only Story | For this story, you should write your queries in raw sql. You can use the ActiveRecord find_by_sql method to execute raw sql queries: https://guides.rubyonrails.org/active_record_querying.html#finding-by-sql | Admin Shelters Index | visit the admin shelter index ('/admin/shelters') | see all Shelters in the system listed in reverse alphabetical order by name
    shelter1 = Shelter.create!(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
    shelter2 = Shelter.create(name: 'Denver Shelter', city: 'Denver, CO', foster_program: true, rank: 7)

    visit '/admin/shelters'

    expect(shelter2.name).to appear_before(shelter1.name)
    expect(page).to have_content(shelter2.name, shelter1.name)
  end
end
