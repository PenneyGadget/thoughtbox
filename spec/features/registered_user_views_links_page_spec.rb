require "rails_helper"

feature "registered user sees their links page" do

  scenario "registered user create links" do
    user = create(:user)
    visit root_path

    click_link "Log In"
    fill_in "Email", with: user.email_address
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq(links_path)

    fill_in "Title", with: "The Google"
    fill_in "Url", with: "https://www.google.com"
    click_button "Add New Link"

    expect(Link.count).to eq(1)

    expect(page).to have_content("The Google")
    expect(page).to have_content("Read?")
    expect(page).to have_content("False")
  end

  scenario "user cannot submit an invalid link" do

  end

end
