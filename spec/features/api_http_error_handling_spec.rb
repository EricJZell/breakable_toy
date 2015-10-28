require 'rails_helper'

feature 'API calls can handle http errors', %{
  As a user
  I want the program to handle an failed API call without crashing
  So that the page doesn't crash with an error

  Acceptance Criteria:
  [] I must be alerted that the API data is not available
  [] I must be redirected to my profile page
} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:location) { FactoryGirl.create(:location) }
  scenario 'API http error is handled' do
    sign_in(user)
    click_link 'New Journal Entry'
    fill_in 'Title', with: 'Great time here'
    fill_in 'Body', with: 'This was the best time ever'
    fill_in 'Latitude', with: location.lat
    fill_in 'Longitude', with: location.lon
    click_button 'Create Entry'
    # expect(page).to have_content('Sorry, swell and weather data not available at this time')
  end
end
