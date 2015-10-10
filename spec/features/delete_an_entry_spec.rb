require 'rails_helper'

feature 'user deletes an entry', %{
  As a user
  I want to be able to delete an entry
  So that it is no longer displayed on the inter-web

  Acceptance Criteria:
  [x] I must be signed in
  [x] I must be on the show page of one of my entries
  [x] I must be provided with a success message on successful upload
} do
  let!(:entry) { FactoryGirl.create(:entry) }
  scenario 'user deletes one of thier entries' do
    user = entry.user
    sign_in(user)
    click_link entry.title
    click_link 'Delete Entry'
    expect(page).to have_content('Journal Entry Deleted!')
    expect(page).to_not have_content(entry.title)
    expect(current_path).to eq(user_path(user))
  end

  scenario 'user cannot update another user entry' do
    user2 = FactoryGirl.create(:user)
    user = entry.user
    sign_in(user2)
    visit user_entry_path(user, entry)
    expect(page).to_not have_content('Delete Entry')
  end
end
