# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    scanned false
    qrcode "http://gnome2home.com/scan/ticket?ticket_id=1"
  end
end
