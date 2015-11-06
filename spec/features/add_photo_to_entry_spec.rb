require 'rails_helper'

feature 'user adds photo to entry', %{
  As a user
  I want to add photos to my journal entries
  So that I can get a picture of how it was

  Acceptance Criteria:
  [x] I must be signed in
  [x] I must be on the show page of one of my entries
  [x] I must choose a file
  [x] I must be provided with a success message on successful upload
} do
  let!(:entry) { FactoryGirl.create(:entry) }
  let!(:swell_data) { FactoryGirl.build(:swell_data)[:data] }
  scenario 'provide valid file' do
    SwellModel.create(entry: entry, swell_data: swell_data)
    user = entry.user
    sign_in(user)
    click_link entry.title
    root_photo = "#{Rails.root}/spec/support/images/example_photo.png"
    attach_file "Entry Photo", root_photo
    find("#add-photo",:visible=>false).click
    expect(page).to have_content('Photo successfully added')
    expect(page).to have_css("img[src*='example_photo.png']")
    expect(entry.photos[0].file_name.file.filename).to eq("example_photo.png")
  end

  scenario 'user does not choose file' do
    SwellModel.create(entry: entry, swell_data: swell_data)
    user = entry.user
    sign_in(user)
    click_link entry.title
    find("#add-photo",:visible=>false).click
    expect(page).to have_content('File name can\'t be blank')
  end
end
