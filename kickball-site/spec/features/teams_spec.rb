require 'spec_helper'

feature "view teams index" do

  # As a Kickball Fan
  # I want to view a page with the names of each team
  # So that I can learn which teams are in the league

  # * [ ] When I visit /teams I should be able to see list of all the team names

  scenario "user visits /teams path" do
    visit "/teams"
    expect(page).to have_content("Simpson Slammers")
  end
end
