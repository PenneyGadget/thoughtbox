require "rails_helper"

feature "unauthenicated user can sign up" do

  scenario "user can register" do
    visit root_path

    expect(page).to have_link("Log In")
    expect(page).to have_link("Sign Up")

    click_link "Sign Up"
    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: "penney@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"

    expect(current_path).to eq(links_path)
  end

  scenario "user must have unique email" do
    create(:user)

    visit root_path
    click_link "Sign Up"

    fill_in "Email", with: "penney@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"

    expect(page).to have_content("Email address has already been taken")
    expect(current_path).to eq(users_path)
  end

  scenario "password and confirmation must match" do
    visit root_path
    click_link "Sign Up"

    fill_in "Email", with: "penney@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password!"
    click_button "Create Account"

    expect(page).to have_content("Passwords don't match")
    expect(current_path).to eq(users_path)
  end

end
