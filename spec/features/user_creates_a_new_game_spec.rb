require 'rails_helper'

RSpec.feature "Creating a new game" do
  scenario "shows a new game code after entering their name" do
    visit '/'
    within("#host") do
      fill_in "user[name]", with: "Hostname"
      click_on "Host Game"
    end

    expect(page).to have_content("Your game code is: ")
  end
end
