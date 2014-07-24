require "rails_helper"
require 'capybara/rails'

feature "guest flow" do
  scenario "guest can go to the homepage" do
    visit "/"

    within("h1") do
      expect(page).to have_content("Welcome to the fishing app")
    end
  end
end