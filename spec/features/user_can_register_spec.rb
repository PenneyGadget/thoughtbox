require "rails_helper"

feature "unauthenicated user can sign up" do

  scenario  "user can register" do
    visit root_path

    expect(current_path).to eq(login_path)
    expect(page).to have_link_or_button("Log In")
    expect(page).to have_link_or_button("Sign Up")

    click_button "Sign Up"

    fill_in "Email", with: "penney@email.com"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_button "Create Account"
  end

end
