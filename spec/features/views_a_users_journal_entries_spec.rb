require 'rails_helper'

feature 'user views journal entries index', %{
  As a user
  I want to view a list of my journal entries
  So that I can browse them

  # Acceptance Criteria
  [] I must be signed in
  [] I must be on the profile page of the user

} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:entry) { FactoryGirl.create(:entry, user: user)}
  scenario 'user views their own profile page' do
    sign_in(user)
    expect(page).to have_content(user.entries[0].title)
  end
end
