require 'rails_helper'

feature 'user adds photo to entry', %{
  As a user
  I want to add photos to my journal entries
  So that I can get a picture of how it was

  Acceptance Criteria:
  [x] I must be signed in
  [x] I must be on the show page of one of my entries
  [x] I must be provided with a success message on successful delete
} do
  let!(:entry) { FactoryGirl.create(:entry) }
  let!(:swell_data) { FactoryGirl.build(:swell_data)[:data] }
  scenario 'User deletes thier own photo' do
    SwellModel.create(entry: entry, swell_data: swell_data)
    user = entry.user
    sign_in(user)
    click_link entry.title
    root_photo = "#{Rails.root}/spec/support/images/example_photo.png"
    attach_file "Entry Photo", root_photo
    find("#add-photo", visible: false).click
    expect(page).to have_css("img[src*='example_photo.png']")
    click_link 'Delete Photo'
    expect(page).to have_content('Photo successfully deleted')
    expect(entry.photos.any?).to be false
  end
  scenario 'User cannot delete another user photo' do
    SwellModel.create(entry: entry, swell_data: swell_data)
    user = entry.user
    user2 = FactoryGirl.create(:user)
    sign_in(user)
    click_link entry.title
    root_photo = "#{Rails.root}/spec/support/images/example_photo.png"
    attach_file "Entry Photo", root_photo
    find("#add-photo", visible: false).click
    click_link('Sign Out')
    create_friendship(user, user2)
    visit entry_path(entry)
    expect(page).to have_css("img[src*='example_photo.png']")
    expect(page).to_not have_content('Delete Photo')
  end
end
