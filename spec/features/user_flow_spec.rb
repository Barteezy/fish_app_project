require "rails_helper"
require 'capybara/rails'

feature "user flow" do
  scenario "guest can go to the homepage" do
    visit "/"

    within("h1") do
      expect(page).to have_content("Fish Log")
    end
    click_on "sign_up"

    fill_in "username", :with => "bill"
    fill_in "password", :with => "bill"
    fill_in "password_confirmation", :with => "bill"
    fill_in "email", :with => "bill@bill.com"

    click_on "sign_up"

    expect(page).to have_content("Thanks for signing up")

    visit "/"

    within("h1") do
      expect(page).to have_content("Fish Log")
    end
    click_on "login"

    fill_in "username", :with => "bill"
    fill_in "password", :with => "bill"

    click_on "login"

    expect(page).to have_content("Welcome")

  end
end