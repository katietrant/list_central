require 'rails_helper'
require 'spec_helper'

feature "listing user's lists" do
  scenario "the user visits their homepage and sees all their lists" do
    user = User.create!(username: "user", email: "user@user.com", password: "password")
    List.create!(name: "Target", user_id: user.id)
    visit login_path
    fill_in 'email', with: 'user@user.com'
    fill_in 'password', with: 'password'
    click_button 'Login'
    visit "/users/show"
    expect(page).to have_content "Target"
  end
end
