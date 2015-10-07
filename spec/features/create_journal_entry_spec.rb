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
    select location.country.region.name, from: 'Region'
    select location.country.name, from: 'Country'
    select location.name, from: 'Location'
    fill_in 'Date', with: '10/12/2015'
    fill_in 'Title', with: 'Great time here'
    fill_in 'Body', with: 'This was the best time ever'
    click_button 'Create Entry'
    expect(page).to have_content('New journal entry created!')
  end

end
