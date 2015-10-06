require 'rails_helper'

feature 'user edits profile', %{
  As a visitor
  I want to edit my profile
  So that I can keep it up to date

  Acceptance Criteria:
  [x] I must be signed in
  [x] I must provide my existing password to make changes
  [x] I must be provided with a message telling me of success of errors
} do
  let!(:user) { FactoryGirl.create(:user) }
  scenario 'provide valid update information' do
    sign_in(user)
    visit edit_user_registration_path
    fill_in 'Current password', with: user.password
    root_photo = "#{Rails.root}/spec/support/images/example_photo.png"
    attach_file "Profile Photo", root_photo
    click_button 'Update'
    user = User.last
    expect(page).to have_content('Your account has been updated successfully.')
    expect(page).to have_content('Sign Out')
    expect(page).to have_css("img[src*='example_photo.png']")
    expect(user.profile_photo.file.filename).to eq("example_photo.png")
  end

  scenario 'provide invalid registration information' do
    sign_in(user)
    visit edit_user_registration_path
    click_button 'Update'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('updated successfully')
  end
end
