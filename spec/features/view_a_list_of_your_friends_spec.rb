require 'rails_helper'

feature 'user views a list of thier friends', %{
  As a user
  I want to view a list of my friends
  So that I can see whose entries I can view

  Acceptance Criteria:
  [x] I must be signed in
  [x] I must be able to get to my friends list from my profile page
  [x] Only accepted friendships should be displayed

} do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  scenario 'user sees all friends with accepted freindships' do
    create_friendship(user1, user2)
    click_link("Friends")
    expect(page).to have_content("Your Friends:")
    expect(page).to have_content(user1.user_name)
  end

  scenario 'user does not see a friend listed if the friendship is declined' do
    decline_friendship(user1, user2)
    click_link("Friends")
    expect(page).to have_content("Your Friends:")
    expect(page).to_not have_content(user1.user_name)
  end
end
