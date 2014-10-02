# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :van do
    driver "MyString"
    direction "MyString"
    departure_time "MyString"
    seats_available "MyString"
    seats_occupied "MyString"
  end
end
