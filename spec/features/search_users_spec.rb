require 'rails_helper'

feature 'user searches users', %{
  As a user
  I want to search for other users
  So that I can find people I may know

  # Acceptance Criteria
  [] I must be able to search by username or actual name

} do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }

  scenario 'search for user by username' do
    visit root_path
    fill_in 'search', with: user1.user_name
    click_button 'Search'
    expect(current_path).to eq("/users")
    expect(page).to have_content(user1.user_name)
    expect(page).to_not have_content(user2.user_name)
  end

  scenario 'search for user by actual name' do
    visit root_path
    fill_in 'search', with: user1.full_name
    click_button 'Search'
    expect(current_path).to eq("/users")
    expect(page).to have_content(user1.user_name)
    expect(page).to_not have_content(user2.user_name)
  end
end
