FactoryGirl.define do

  factory :link do
    title "Turing"
    url "https://www.turing.io/"
    read false
    user_id 1
  end

  factory :user do
    email_address "penney@email.com"
    password "password"
    password_confirmation "password"
  end

end
