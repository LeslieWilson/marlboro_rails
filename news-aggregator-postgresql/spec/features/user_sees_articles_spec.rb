require "spec_helper"

feature "user sees all articles" do
  scenario "user views articles with their title, url, and description" do
    title = "Valid Title"
    url = "https://www.google.com"
    description = "Valid description text"
    db_connection do |conn|
      sql_query = %(
        INSERT INTO articles (title, url, description)
        VALUES ($1, $2, $3)
      )
      data = [title, url, description]
      conn.exec_params(sql_query, data)
    end

    visit "/articles"

    expect(page).to have_content(title)
    expect(page).to have_css("a[href='#{url}']")
    expect(page).to have_content(description)
  end
end
