require 'rails_helper'
require 'spec_helper'

feature "user login" do
  scenario "the user sees a link to login on the homepage" do
    visit root_path
    expect(page).to have_link("Login")
  end

  scenario "user logs in" do
    user = User.create!(username: "user", email: "user@user.com", password: "password")
    visit login_path
    fill_in 'email', with: 'user@user.com'
    fill_in 'password', with: 'password'
    click_button 'Login'
    expect(page).to have_content "List Central"
  end

  scenario "user sees error when logging in with incorrect password" do
    user = User.create!(username: "user", email: "user@user.com", password: "password")
    visit login_path
    fill_in 'email', with: 'user@user.com'
    fill_in 'password', with: 'testing'
    click_button 'Login'
    expect(page).to have_content "not match"
  end

end
