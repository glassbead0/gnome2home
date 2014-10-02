# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


28.times do |y|
  van = Van.create(driver: 'Daniel', direction: 'S')
  stop1 = Stop.create(location: 'CSU', time: Time.new(2014, 10, 2, 8) + y.days)
  stop2 = Stop.create(location: 'Harmony Rd', time: stop1.time + 10.minutes)
  stop3 = Stop.create(location: 'Thornton', time: stop2.time + 35.minutes)
  stop4 = Stop.create(location: 'Union Station', time: stop3.time + 15.minutes)
  van.stops << stop1 << stop2 << stop3 << stop4

  van2 = Van.create(driver: 'Daniel', direction: 'N')
  stop5 = Stop.create(location: 'Union Station', time: Time.new(2014, 10, 2, 9, 15) + y.days)
  stop6 = Stop.create(location: 'Thornton', time: stop5.time + 15.minutes)
  stop7 = Stop.create(location: 'Harmony Rd', time: stop6.time + 35.minutes)
  stop8 = Stop.create(location: 'CSU', time: stop7.time + 10.minutes)
  van2.stops << stop5 << stop6 << stop7 << stop8

  van = Van.create(driver: 'Daniel', direction: 'S')
  stop1 = Stop.create(location: 'CSU', time: Time.new(2014, 10, 2, 15, 30) + y.days)
  stop2 = Stop.create(location: 'Harmony Rd', time: stop1.time + 10.minutes)
  stop3 = Stop.create(location: 'Thornton', time: stop2.time + 35.minutes)
  stop4 = Stop.create(location: 'Union Station', time: stop3.time + 15.minutes)
  van.stops << stop1 << stop2 << stop3 << stop4

  van2 = Van.create(driver: 'Daniel', direction: 'N')
  stop5 = Stop.create(location: 'Union Station', time: Time.new(2014, 10, 2, 16, 45) + y.days)
  stop6 = Stop.create(location: 'Thornton', time: stop5.time + 15.minutes)
  stop7 = Stop.create(location: 'Harmony Rd', time: stop6.time + 35.minutes)
  stop8 = Stop.create(location: 'CSU', time: stop7.time + 10.minutes)
  van2.stops << stop5 << stop6 << stop7 << stop8

end
