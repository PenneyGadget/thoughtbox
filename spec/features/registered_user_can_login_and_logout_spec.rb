require "rails_helper"

feature "registered user flow" do

  scenario "registered user can return, login, and logout" do
    create(:user)
    visit root_path

    click_link "Log In"
    fill_in "Email", with: "penney@email.com"
    fill_in "Password", with: "password"
    click_button "Login"
    
    expect(current_path).to eq(links_path)
    expect(page).to have_content("Log Out")

    click_link "Log Out"

    expect(current_path).to eq(login_path)
  end

end
