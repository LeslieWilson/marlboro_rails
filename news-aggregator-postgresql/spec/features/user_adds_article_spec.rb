require "spec_helper"

feature "user adds article" do
  let(:title) { "Valid Title" }
  let(:url) { "https://www.google.com" }
  let(:description) { "Valid description text" }

  scenario "user successfully adds an article" do
    visit "/articles/new"
    fill_in "Title", with: title
    fill_in "URL", with: url
    fill_in "Description", with: description
    click_button "Submit"

    expect(page).to have_current_path("/articles")
    expect(page).to have_content(title)
    expect(page).to have_css("a[href='#{url}']")
    expect(page).to have_content(description)
  end

  xcontext "invalid form submission" do
    scenario "form not filled out completely" do
      visit "/articles/new"
      fill_in "Title", with: title
      click_button "Submit"

      expect(page).to have_content("Please completely fill out form")
    end

    scenario "invalid URL submitted" do
      visit "/articles/new"
      fill_in "Title", with: title
      fill_in "URL", with: "invalid url"
      fill_in "Description", with: description
      click_button "Submit"

      expect(page).to have_content("Invalid URL")
    end

    scenario "already existing URL submitted" do
      db_connection do |conn|
        sql_query = %(
          INSERT INTO articles (title, url, description)
          VALUES ($1, $2, $3)
        )
        data = [title, url, description]
        conn.exec_params(sql_query, data)
      end

      visit "/articles/new"
      fill_in "Title", with: title
      fill_in "URL", with: url
      fill_in "Description", with: description
      click_button "Submit"

      expect(page).to have_content("Article with same url already submitted")
    end

    scenario "too short of a description submitted" do
      visit "/articles/new"
      fill_in "Title", with: title
      fill_in "URL", with: url
      fill_in "Description", with: "hi mom"
      click_button "Submit"

      expect(page).to have_content("Description must be at least 20 characters long")
    end

    scenario "more than one error message may be shown" do
      visit "/articles/new"
      fill_in "URL", with: "invalid url"
      fill_in "Description", with: "hi mom"
      click_button "Submit"

      expect(page).to have_content("Please completely fill out form")
      expect(page).to have_content("Invalid URL")
      expect(page).to have_content("Description must be at least 20 characters long")
    end

    scenario "form is re-rendered with previously submitted details" do
      visit "/articles/new"
      fill_in "Title", with: title
      click_button "Submit"

      expect(page).to have_css("input[value='#{title}']")
    end
  end
end

