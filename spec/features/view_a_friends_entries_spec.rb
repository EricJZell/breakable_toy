require 'rails_helper'

feature 'view a friends journal entry', %{
  As a user
  I want to view my friends journal entry details
  So that I can see thier surf travel details

  # Acceptance Criteria
  [x] I must be signed in
  [x] I must be friends with the other user
  [x] I must be able to navigate there from the other user profile page
  [x] I must see the entry location, date, and body

} do
  let!(:entry) { FactoryGirl.create(:entry) }
  let!(:swell_data) { FactoryGirl.build(:swell_data)[:data] }
  let!(:user1) { FactoryGirl.create(:user) }
  scenario 'a user views thier friends entry details' do
    SwellModel.create(entry: entry, swell_data: swell_data)
    user2 = entry.user
    create_friendship(user2, user1)
    visit user_path(user2)
    click_link entry.title
    expect(page).to have_content(entry.body)
    expect(page).to have_content(entry.date)
    expect(page).to have_content(entry.location.name)
  end

  scenario 'non-friend tries to view a users journal entry' do
    SwellModel.create(entry: entry, swell_data: swell_data)
    user2 = entry.user
    sign_in(user1)
    visit user_path(user2)
    click_link entry.title
    expect(page).to have_content("You must be friends to access this section")
  end
end
