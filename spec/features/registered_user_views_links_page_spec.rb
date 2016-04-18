require "rails_helper"

feature "registered user sees their links page" do

  scenario "registered user can create links" do
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
    expect(page).to have_content("No")
    expect(page).to have_content("Mark as Read")
  end

  scenario "user cannot submit an invalid link" do
    user = create(:user)
    visit root_path

    click_link "Log In"
    fill_in "Email", with: user.email_address
    fill_in "Password", with: "password"
    click_button "Login"

    fill_in "Title", with: "The Google"
    fill_in "Url", with: "httx.grr.com"
    click_button "Add New Link"

    expect(page).to have_content("Invalid Link")
    expect(Link.count).to eq(0)
  end

  scenario "one user cannot view another users links" do
    user_1 = create(:user)
    user_1_link = create(:link)
    user_1.links << user_1_link

    visit root_path
    click_link "Sign Up"
    fill_in "Email", with: "second_user@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"

    visit links_path
    expect(page).to_not have_content(user_1.links.first.title)
    expect(page).to_not have_content(user_1.links.first.url)
  end

end
