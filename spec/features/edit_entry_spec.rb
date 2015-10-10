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
  scenario 'provide valid update information' do
    user = entry.user
    location = entry.location
    sign_in(user)
    click_link entry.title
    click_link 'Edit Entry'
    select location.country.region.name, from: 'region-select'
    select location.country.name, from: 'country-select'
    select location.name, from: 'location-select'
    fill_in 'Date', with: '10/9/2015'
    fill_in 'Title', with: 'Yewww'
    fill_in 'Body', with: 'wa-pash'
    click_button 'Update Entry'
    expect(page).to have_content('Journal Entry Updated!')
    expect(page).to have_content('wa-pash')
    expect(current_path).to eq(user_entry_path(user, entry))
  end

  scenario 'user cannot update another user entry' do
    user2 = FactoryGirl.create(:user)
    user = entry.user
    sign_in(user2)
    visit user_entry_path(user, entry)
    expect(page).to_not have_content('Edit Entry')
  end
end
