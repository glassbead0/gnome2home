# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


28.times do |y|
  van = Van.create(driver: 'Daniel', direction: 'S')
  stop1 = Stop.create(location: 'CSU', time: Time.new(2014, 10, 2, 8) + y.days, human_readable: 'CSU at ' + (Time.new(2014, 10, 2, 8) + y.days).strftime('%a: %b %e, %l:%M %P'))
  stop2 = Stop.create(location: 'Harmony Rd', time: stop1.time + 10.minutes, human_readable: 'Harmony Rd at ' + (stop1.time + 10.minutes).strftime('%a: %b %e, %l:%M %P'))
  stop3 = Stop.create(location: 'Thornton', time: stop2.time + 35.minutes, human_readable: 'Thornton at ' + (stop2.time + 35.minutes).strftime('%a: %b %e, %l:%M %P'))
  stop4 = Stop.create(location: 'Union Station', time: stop3.time + 15.minutes, human_readable: 'Union Station at ' + (stop3.time + 15.minutes).strftime('%a: %b %e, %l:%M %P'))
  van.stops << stop1 << stop2 << stop3 << stop4
  van.departure_time = stop1.time
  van.departure_time_readable = stop1.location + ' on ' + van.departure_time.strftime('%a: %b %e, %l:%M %P')
  van.save

  van2 = Van.create(driver: 'Daniel', direction: 'N')
  stop5 = Stop.create(location: 'Union Station', time: Time.new(2014, 10, 2, 9, 15) + y.days, human_readable: 'Union Station at ' + (Time.new(2014, 10, 2, 9, 15) + y.days).strftime('%a: %b %e, %l:%M %P'))
  stop6 = Stop.create(location: 'Thornton', time: stop5.time + 15.minutes, human_readable: 'Thornton at ' + (stop5.time + 15.minutes).strftime('%a: %b %e, %l:%M %P'))
  stop7 = Stop.create(location: 'Harmony Rd', time: stop6.time + 35.minutes, human_readable: 'Harmony Rd at ' + (stop6.time + 35.minutes).strftime('%a: %b %e, %l:%M %P'))
  stop8 = Stop.create(location: 'CSU', time: stop7.time + 10.minutes, human_readable: 'CSU at ' + (stop7.time + 10.minutes).strftime('%a: %b %e, %l:%M %P'))
  van2.stops << stop5 << stop6 << stop7 << stop8
  van2.departure_time = stop5.time
  van2.departure_time_readable = stop5.location + ' on ' + van2.departure_time.strftime('%a: %b %e, %l:%M %P')
  van2.save

  van = Van.create(driver: 'Daniel', direction: 'S')
  stop1 = Stop.create(location: 'CSU', time: Time.new(2014, 10, 2, 15, 30) + y.days, human_readable: 'CSU at ' + (Time.new(2014, 10, 2, 15, 30) + y.days).strftime('%a: %b %e, %l:%M %P'))
  stop2 = Stop.create(location: 'Harmony Rd', time: stop1.time + 10.minutes, human_readable: 'Harmony Rd at ' + (stop1.time + 10.minutes).strftime('%a: %b %e, %l:%M %P'))
  stop3 = Stop.create(location: 'Thornton', time: stop2.time + 35.minutes, human_readable: 'Thornton at ' + (stop2.time + 35.minutes).strftime('%a: %b %e, %l:%M %P'))
  stop4 = Stop.create(location: 'Union Station', time: stop3.time + 15.minutes, human_readable: 'Union Station at ' + (stop3.time + 15.minutes).strftime('%a: %b %e, %l:%M %P'))
  van.stops << stop1 << stop2 << stop3 << stop4
  van.departure_time = stop1.time
  van.departure_time_readable = stop1.location + ' on ' + van.departure_time.strftime('%a: %b %e, %l:%M %P')
  van.save

  van2 = Van.create(driver: 'Daniel', direction: 'N')
  stop5 = Stop.create(location: 'Union Station', time: Time.new(2014, 10, 2, 16, 45) + y.days, human_readable: 'Union Station at ' + (Time.new(2014, 10, 2, 16, 45) + y.days).strftime('%a: %b %e, %l:%M %P'))
  stop6 = Stop.create(location: 'Thornton', time: stop5.time + 15.minutes, human_readable: 'Thornton at ' + (stop5.time + 15.minutes).strftime('%a: %b %e, %l:%M %P'))
  stop7 = Stop.create(location: 'Harmony Rd', time: stop6.time + 35.minutes, human_readable: 'Harmony Rd at ' + (stop6.time + 35.minutes).strftime('%a: %b %e, %l:%M %P'))
  stop8 = Stop.create(location: 'CSU', time: stop7.time + 10.minutes, human_readable: 'CSU at ' + (stop7.time + 10.minutes).strftime('%a: %b %e, %l:%M %P'))
  van2.stops << stop5 << stop6 << stop7 << stop8
  van2.departure_time = stop5.time
  van2.departure_time_readable = stop5.location + ' on ' + van2.departure_time.strftime('%a: %b %e, %l:%M %P')
  van2.save

end
