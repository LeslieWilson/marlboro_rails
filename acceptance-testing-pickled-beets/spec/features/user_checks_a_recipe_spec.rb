#
# require 'spec_helper'
# feature "User adds two numbers" do
#  # As a calculator user
#  # I want to add two numbers together
#  # So that I can determine the resulting sum
#
#  # Acceptance Criteria:
#
#  # * When I supply two numbers and request the sum to be calculated, I receive the mathematically correct result
#  # * I must supply two numbers. If I don't, I receive an error after requesting the sum to be calculated
#
#  scenario 'supply two numbers and calculate the sum' do
#    visit '/'
#    fill_in 'First Number', with: '3'
#    fill_in 'Second Number', with: '5'
#    click_button '+'
#
#    expect(page).to have_content("result: #{3+5}")
#  end
#
#  scenario 'do not supply a first number' do
#    visit '/'
#    fill_in 'Second Number', with: '5'
#    click_button '+'
#
#    expect(page).to have_content("Error! " +
#      "Please supply more than one number")
#  end
#
# end



require "spec_helper"

feature "User checks a recipe's deliciousness", %(
  As a user
  I want to submit a recipe name to see if it is delicious
  So that I know with confidence what to cook.

  Acceptance Criteria:
  [ ] When I visit the root path, I can see a form to submit a recipe name
  [ ] If I submit a recipe name with "pickled beets" in the name, I am
      sent to a "results" page telling me that the recipe is delicious
  [ ] If I submit a recipe name without "pickled beets" in the name, I am
      sent to a "results" page telling me that the recipe is not delicious
  [ ] From the "results" page, I am able to click a link bringing me back to
      the home page
  [ ] If I submit a blank entry to the form, I am brought to an error page
  [ ] From the error page, I can click a link bringing me back to the home page

) do

  scenario "user submits a recipe name containing 'pickled beets'" do
      visit  '/'
      fill_in 'Recipe Name', with:'pickled beets'
      click_button 'Submit'
      expect(page).to have_content("is a delicious recipe!")

  end

  scenario "user submits a recipe name without 'pickled beets'" do
      visit '/'
      fill_in  'Recipe Name', with:'pumpkin'
      click_button 'Submit'
      expect(page).to have_content("is not a delicious recipe!")

  end

  scenario "user navigates back to the home page after checking a recipe name" do
      visit '/'
      fill_in  'Recipe Name', with:'pumpkin'
      click_button 'Submit'
      expect(page).to have_link("Try again!")
      click_link 'Try again!'
      expect(page).to have_current_path("/")
      expect(page).to have_content('Instructions:')


  end

  scenario "user submits an empty form" do
      visit '/'
      fill_in 'Recipe Name', with:''
      click_button 'Submit'
      expect(page).to have_content('Error!')

  end

  scenario "user navigates back to the home page after submitting an empty form" do
      visit '/'
      fill_in 'Recipe Name', with:''
      click_button 'Submit'
      click_link 'Try again!'
      expect(page).to have_current_path("/")

  end
end
