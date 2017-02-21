require 'rails_helper'
require 'spec_helper'

feature "listing user's list items" do
  scenario "the user visits a list and sees all their items" do
    user = User.create!(username: "user", email: "user@user.com", password: "password")
    list = List.create!(name: "Target", user_id: user.id)
    Item.create(product: "Awesome Kicks", quantity: 1, list_id: list.id)
    visit login_path
    fill_in 'email', with: 'user@user.com'
    fill_in 'password', with: 'password'
    click_button 'Login'
    visit "/lists/#{list.id}"
    expect(page).to have_content "Awesome Kicks"
  end
end
