# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    title "Best dive ever"
    body  "So many great things to see!"
    rating "5"
    date Date.new(2012, 12, 3)
    user_id "1"
    divesite_id "1"
  end
end
