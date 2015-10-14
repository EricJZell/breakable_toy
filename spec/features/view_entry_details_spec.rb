require 'rails_helper'

feature 'view journal entry details', %{
  As a user
  I want to view journal entry details
  So that I can see more about it

  # Acceptance Criteria
  [x] I must be signed in
  [x] I must be able to navigate there from the user profile page
  [x] I must see the entry location, date, and body

} do
  let!(:entry) { FactoryGirl.create(:entry) }
  let!(:swell_data) { FactoryGirl.build(:swell_data)[:data] }
  scenario 'signed in user views details' do
    SwellModel.create(entry: entry, swell_data: swell_data)
    user = entry.user
    sign_in(user)
    click_link entry.title
    expect(page).to have_content(entry.body)
    expect(page).to have_content(entry.date)
    expect(page).to have_content(entry.location.name)
  end

  scenario 'non-user views page' do
    user = entry.user
    visit user_path(user)
    click_link entry.title
    expect(page).to have_content('You need to sign in')
  end
end
