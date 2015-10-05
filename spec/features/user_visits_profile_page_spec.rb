require 'rails_helper'

feature 'user visits profile page', %{
  As an authenticated user
  I want to view my profile page
  So that I can see how it looks

  # Acceptance Criteria
  [] I must be signed in
  [] I must navigate to my profile from the home page

} do

  scenario 'authenticated user signs out' do
    user = FactoryGirl.create(:user)
    sign_in(user)
    click_link 'View Your Profile'
    expect(current_path).to eq("/users/#{user.id}")
  end

end
