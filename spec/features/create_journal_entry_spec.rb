require 'rails_helper'

feature 'user creates journal entry', %{
  As an authenticated user
  I want to post a journal entry
  So that I can create a log of all of my sessions
  Acceptance Criteria:
  [] I must be logged in
  [] I must provide a title, location, and date.
  [] I can optionally pull a real-time swell model from MSW API to
     attach to the entry
  [] I can optionally provide a number of photos to the entry
  [] I must be notified if my post was successful or unsuccessful

} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:location) { FactoryGirl.create(:location) }
  scenario 'authenticated user creates entry' do
    sign_in(user)
    click_link 'New Journal Entry'
    select '2011', from: 'entry_date_1i'
    select 'October', from: 'entry_date_2i'
    select '15', from: 'entry_date_3i'
    fill_in 'Title', with: 'Great time here'
    fill_in 'Body', with: 'This was the best time ever'
    fill_in 'Latitude', with: location.lat
    fill_in 'Longitude', with: location.lon
    click_button 'Create Entry'
    expect(page).to have_content('New journal entry created!')
  end

  scenario 'User does not provide required entry information' do
    sign_in(user)
    click_link 'New Journal Entry'
    fill_in 'Latitude', with: location.lat
    fill_in 'Longitude', with: location.lon
    click_button "Create Entry"
    expect(page).to have_content('Title can\'t be blank')
  end
end
