
FactoryGirl.define do
  factory :user do
    first_name "first"
    last_name "last"
    sequence(:email) {|n| "test#{n}@test.com"}
    password "password123"

  end
end
