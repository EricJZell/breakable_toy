require 'rails_helper'

feature 'view journal entry details', %{
  As a user
  I want to view journal entry details
  So that I can see more about it

  # Acceptance Criteria
  [] I must be signed in
  [] I must be able to navigate there from the user profile page
  [] I must see the entry location, date, and body

} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:entry) { FactoryGirl.create(:entry, user: user) }
  scenario 'signed in user views details' do
    sign_in(user)
    click_link entry.title
    expect(page).to have_content(entry.body)
    expect(page).to have_content(entry.date)
    expect(page).to have_content(entry.location.name)
  end

  scenario 'non-user views page' do
    visit user_path(user)
    click_link entry.title
    expect(page).to have_content('You need to sign in')
  end
end
