require "rails_helper"

feature "user can edit their links" do

  scenario "new values are displayed" do
    user = create(:user)
    user_link = create(:link)
    user.links << user_link

    visit login_path

    fill_in "Email", with: user.email_address
    fill_in "Password", with: "password"
    click_on "Login"

    click_on "Edit"

    expect(current_path).to eq(edit_link_path(user_link))

    fill_in "Title", with: "New Title!"
    fill_in "Url", with: "https://duckduckgo.com/"
    click_button "Update Link"

    expect(current_path).to eq(links_path)
    expect(page).to have_content "New Title!"
    expect(page).to have_content "https://duckduckgo.com/"
    expect(page).to have_content "Mark as Read"

    expect(page).to_not have_content user_link.title
    expect(page).to_not have_content user_link.url
  end

  scenario "cannot edit url to invalid url" do
    user = create(:user)
    user_link = create(:link)
    user.links << user_link

    visit login_path

    fill_in "Email", with: user.email_address
    fill_in "Password", with: "password"
    click_on "Login"

    click_on "Edit"

    fill_in "Url", with: "gobbitygook"
    click_button "Update Link"

    expect(current_path).to eq(link_path(user_link))
    expect(page).to have_content("Must have valid title and url")
  end

end
