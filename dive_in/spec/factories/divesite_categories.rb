# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :divesite_category, :class => 'DivesiteCategories' do
    divesite
    category
  end
end
