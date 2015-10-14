require 'rails_helper'

feature 'user edits an entry', %{
  As a user
  I want to edit my entries
  So that I can make them more accurate or update information

  Acceptance Criteria:
  [x] I must be signed in
  [x] I must be on the show page of one of my entries
  [x] I must be provided with a success message on successful upload
} do
  let!(:entry) { FactoryGirl.create(:entry) }
  let!(:swell_data) { FactoryGirl.build(:swell_data)[:data] }
  scenario 'user provides valid update information' do
    SwellModel.create(entry: entry, swell_data: swell_data)
    user = entry.user
    location = entry.location
    sign_in(user)
    click_link entry.title
    click_link 'Edit Entry'
    select '2013', from: 'entry_date_1i'
    select 'October', from: 'entry_date_2i'
    select '25', from: 'entry_date_3i'
    fill_in 'Title', with: 'Yewww'
    fill_in 'Body', with: 'wa-pash'
    fill_in 'Latitude', with: location.lat
    fill_in 'Longitude', with: location.lon
    click_button 'Update Entry'
    expect(page).to have_content('Journal Entry Updated!')
    expect(page).to have_content('wa-pash')
    expect(current_path).to eq(user_entry_path(user, entry))
  end

  scenario 'user provides invalid update information' do
    SwellModel.create(entry: entry, swell_data: swell_data)
    user = entry.user
    location = entry.location
    sign_in(user)
    click_link entry.title
    click_link 'Edit Entry'
    fill_in 'Title', with: ''
    fill_in 'Latitude', with: location.lat
    fill_in 'Longitude', with: location.lon
    click_button 'Update Entry'
    expect(page).to have_content('Title can\'t be blank')
    expect(page).to have_content('Fill out entry details below:')
  end

  scenario 'user cannot update another user entry' do
    sm = SwellModel.create(entry: entry, swell_data: swell_data)
    user2 = FactoryGirl.create(:user)
    user = entry.user
    sign_in(user2)
    visit user_entry_path(user, entry)
    expect(page).to_not have_content('Edit Entry')
  end
end
