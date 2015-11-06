module Helpers
  def sign_in(user)
    visit root_path
    visit '/users/sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  def create_friendship(user1, user2)
    sign_in(user1)
    visit(user_path(user2))
    click_link("Add Friend")
    click_link("Sign Out")
    sign_in(user2)
    click_link("Accept")
  end

  def decline_friendship(user1, user2)
    sign_in(user1)
    visit(user_path(user2))
    click_link("Add Friend")
    click_link("Sign Out")
    sign_in(user2)
    click_link("Decline")
  end
end
