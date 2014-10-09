# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :van do
    driver "Daniel"
    direction "S"
    departure_time Time.local(2014, 10, 3, 8, 30) # departs from CSU on Fri: Oct 3, 8:30 am
    seats_available 14
    seats_occupied 0
    departure_time_readable 'CSU on ' + Time.local(2014, 10, 3, 8, 30).strftime('%a: %b %e, %l:%M %P')

  end
end
