require "spec_helper"

feature "user sees grocery list" do
  scenario "user views all grocery list items" do
    CSV.open("grocery_list.csv", "a", headers: true) do |file|
      name = "tacos"
      file.puts([name])
    end

    visit "/list"
    expect(page).to have_content("tacos")
  end

  scenario "user sees all grocery items at root path due to a redirect" do
    CSV.open("grocery_list.csv", "a", headers: true) do |file|
      name = "tacos"
      file.puts([name])
    end

    visit "/"
    expect(page).to have_content("tacos")
    expect(current_path).to eq("/list")
  end
end
