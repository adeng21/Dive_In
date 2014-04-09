# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :divesite do
    name "blue hole"
    region "caye caulker"
    country "Belize"
    latitude 14.5
    longitude -8.2
    description "into the abyss"
    surrounding_area "nice islands"
    rating 5
    water_temperature "30-35"
    visibility "really clear"
    # after_create do |divesite|
    #     divesite.categories << FactoryGirl.create_list(:category, 2)
    # end
  end
end

# divesite = FactoryGirl.create(:divesite)
# categories = FactoryGirl.create_list(:category, 3)
# divesite.categories << categories

# add_index :table_name, [:column1, :column2], unique: true

