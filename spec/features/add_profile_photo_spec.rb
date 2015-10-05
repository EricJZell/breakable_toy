require 'rails_helper'

feature 'user adds profile photo', %{
  As a registering user
  I want to add a profile photo
  So people see my photo when they view my profile

  # Acceptance Criteria
  [x] I must be signed in
  [x] I must upload my photo
  [x] I must see the photo on my profile page

} do

  scenario 'User uploads photo during registration' do
    visit new_user_registration_path
    fill_in 'Email', with: 'carrierwave@yahoo.com'
    fill_in 'Password', with: 'testtest'
    fill_in 'Password confirmation', with: 'testtest'
    root_photo = "#{Rails.root}/spec/support/images/example_photo.png"
    attach_file "Profile Photo", root_photo
    click_on "Sign up"
    user = User.last
    expect(page).to have_content("You have signed up successfully.")
    expect(page).to have_css("img[src*='example_photo.png']")
    expect(user.profile_photo.file.filename).to eq("example_photo.png")
  end

end
