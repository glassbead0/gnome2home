# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stop do
    location 'CSU'
    time Time.now
    human_readable  'CSU at ' + Time.now.strftime('%a: %b %e, %l:%M %P')

  end
end
