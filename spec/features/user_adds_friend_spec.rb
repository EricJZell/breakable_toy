require 'rails_helper'

feature 'user adds a friend', %{
  As a user
  I want to add a friend
  So that I can share journal entries with them

  Acceptance Criteria:
  [x] I must be signed in
  [x] I must be on my prospective friend's profile page to add them
  [x] We must not already be friends
  [x] I must be provided with a success message on successful friend request
  [x] The other user must accept my request in order for us to be friends

} do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  scenario 'user1 requests user2 friendship, and it is accepted' do
    sign_in(user1)
    visit(user_path(user2))
    click_link("Add Friend")
    expect(page).to have_content('Friend requested')

    click_link("Sign Out")
    sign_in(user2)
    expect(page).to have_content("From: @#{user1.user_name}")
    click_link("Accept")
    expect(page).to have_content("Successfully confirmed friend")
    expect(user1.friends.last).to eq(user2)
  end

  scenario 'user1 requests user2 friendship, and it is declined' do
    sign_in(user1)
    visit(user_path(user2))
    click_link("Add Friend")
    expect(page).to have_content('Friend requested')

    click_link("Sign Out")
    sign_in(user2)
    expect(page).to have_content("From: @#{user1.user_name}")
    click_link("Decline")
    expect(page).to have_content("Friendship declined")
    expect(user1.friends.length).to eq(0)
  end
end
