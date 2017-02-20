require "rails_helper"

feature "register new user" do
  scenario "the user sees a form to register" do
    visit new_user_path
    expect(page).to have_content("Create A New Account")
  end
end

feature "a new user can register" do
  scenario "the user visits registration page and registers" do
    visit new_user_path
      fill_in 'user[username]', with: 'user'
      fill_in 'user[email]', with: 'user@user.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_button 'Submit'
      expect(page).to have_content('Create a New List')
  end
end
