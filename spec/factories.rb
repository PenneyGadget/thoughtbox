FactoryGirl.define do
  factory :user do
    email_address "penney@email.com"
    password "password"
    password_confirmation "password"
  end
end
