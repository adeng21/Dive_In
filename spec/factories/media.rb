# Read about factories at https://github.com/thoughtbot/factory_girl
# include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :medium do
    image File.open(File.join(Rails.root, '/spec/file_fixtures/blue_hole.jpg'))
    divesite
  end
end
