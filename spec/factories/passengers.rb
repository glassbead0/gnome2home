# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :passenger do
    email "MyString"
    first_name "MyString"
    last_name "MyString"
    password "MyString"
    password_confirmation "MyString"
    phone "MyString"
  end
end
