require 'faker'
require 'pry'

u1 = User.create(name: Faker::Name.name)
u2 = User.create(name: Faker::Name.name)
u3 = User.create(name: Faker::Name.name)
u4 = User.create(name: Faker::Name.name)
u5 = User.create(name: Faker::Name.name)
u6 = User.create(name: Faker::Name.name)
u7 = User.create(name: Faker::Name.name)
u8 = User.create(name: Faker::Name.name)

sun8 = Timeslot.find_or_create_by(day: 0, start_time: 2000, end_time: 2100)
sun9 = Timeslot.find_or_create_by(day: 0, start_time: 2100, end_time: 2200)
mon8 = Timeslot.find_or_create_by(day: 1, start_time: 2000, end_time: 2100)
mon9 = Timeslot.find_or_create_by(day: 1, start_time: 2100, end_time: 2200)
tue8 = Timeslot.find_or_create_by(day: 2, start_time: 2000, end_time: 2100)
tue9 = Timeslot.find_or_create_by(day: 2, start_time: 2100, end_time: 2200)
wed8 = Timeslot.find_or_create_by(day: 3, start_time: 2000, end_time: 2100)
wed9 = Timeslot.find_or_create_by(day: 3, start_time: 2100, end_time: 2200)
thurs8 = Timeslot.find_or_create_by(day: 4, start_time: 2000, end_time: 2100)
thurs9 = Timeslot.find_or_create_by(day: 4, start_time: 2100, end_time: 2200)
fri8 =  Timeslot.find_or_create_by(day: 5, start_time: 2000, end_time: 2100)
fri9 = Timeslot.find_or_create_by(day: 5, start_time: 2100, end_time: 2200)
sat8 = Timeslot.find_or_create_by(day: 6, start_time: 2000, end_time: 2100)
sat9 = Timeslot.find_or_create_by(day: 6, start_time: 2100, end_time: 2200)

the_simpsons = Show.create(title: Faker::Book.title, genre: Faker::Book.genre, timeslot_id: sun8.id)
real_house_pot = Show.create(title: Faker::Book.title, genre: Faker::Book.genre, timeslot_id: sun9.id)
good_place = Show.create(title: Faker::Book.title, genre: Faker::Book.genre, timeslot_id: sun8.id)
sh4 = Show.create(title: Faker::Book.title, genre: Faker::Book.genre, timeslot_id: sun9.id)
sh4 = Show.create(title: Faker::Book.title, genre: Faker::Book.genre, timeslot_id: mon8.id)
sh6 = Show.create(title: Faker::Book.title, genre: Faker::Book.genre, timeslot_id: mon9.id)
sh7 = Show.create(title: Faker::Book.title, genre: Faker::Book.genre, timeslot_id: mon8.id)
sh8 = Show.create(title: Faker::Book.title, genre: Faker::Book.genre, timeslot_id: mon9.id)
sh9 = Show.create(title: Faker::Book.title, genre: Faker::Book.genre, timeslot_id: tue8.id)
sh10 = Show.create(title: Faker::Book.title, genre: Faker::Book.genre, timeslot_id: tue9.id)
sh11 = Show.create(title: Faker::Book.title, genre: Faker::Book.genre, timeslot_id: tue8.id)
sh12 = Show.create(title: Faker::Book.title, genre: Faker::Book.genre, timeslot_id: tue9.id)
sh13 = Show.create(title: Faker::Book.title, genre: Faker::Book.genre, timeslot_id: wed8.id)
sh14 = Show.create(title: Faker::Book.title, genre: Faker::Book.genre, timeslot_id: wed9.id)
sh13 = Show.create(title: Faker::Book.title, genre: Faker::Book.genre, timeslot_id: wed8.id)
sh14 = Show.create(title: Faker::Book.title, genre: Faker::Book.genre, timeslot_id: wed9.id)

JoinUsertimeslot.find_or_create_by(user_id: u1.id, timeslot_id: sun8.id, show_id: sh1.id)
JoinUsertimeslot.find_or_create_by(user_id: u2.id, timeslot_id: sun9.id, show_id: sh2.id)
JoinUsertimeslot.find_or_create_by(user_id: u2.id, timeslot_id: mon8.id, show_id: sh3.id)
JoinUsertimeslot.find_or_create_by(user_id: u2.id, timeslot_id: mon9.id, show_id: sh4.id)
JoinUsertimeslot.find_or_create_by(user_id: u3.id, timeslot_id: mon9.id, show_id: sh4.id)
JoinUsertimeslot.find_or_create_by(user_id: u7.id, timeslot_id: sun9.id, show_id: sh7.id)
