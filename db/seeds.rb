require 'faker'
require 'pry'
# User.destroy_all
pey = User.find_or_create_by(name: "Peyton")
ris = User.find_or_create_by(name: "Marisa")
germ = User.find_or_create_by(name: "German")
oprah = User.find_or_create_by(name: "Oprah")
# u5 = User.create(name: Faker::Name.name)
# u6 = User.create(name: Faker::Name.name)
# oprah = User.create(name: Faker::Name.name)
# u8 = User.create(name: Faker::Name.name)

sun8 = Timeslot.find_or_create_by(day: 0, start_time: 2000, end_time: 2100)
sun9 = Timeslot.find_or_create_by(day: 0, start_time: 2100, end_time: 2200)
mon8 = Timeslot.find_or_create_by(day: 1, start_time: 2000, end_time: 2100)
mon9 = Timeslot.find_or_create_by(day: 1, start_time: 2100, end_time: 2200)
tue8 = Timeslot.find_or_create_by(day: 2, start_time: 2000, end_time: 2100)
tue9 = Timeslot.find_or_create_by(day: 2, start_time: 2100, end_time: 2200)

# Show.destroy_all
simpsons = Show.find_or_create_by(title: "The Simpsons", genre: "Comedy", timeslot_id: sun8.id)
got = Show.find_or_create_by(title: "Game of Thrones", genre: "Fantasy", timeslot_id: sun9.id)
bach = Show.find_or_create_by(title: "The Bachelorette", genre: "Reality", timeslot_id: mon8.id)
rmaddow = Show.find_or_create_by(title: "The Rachel Maddow Show", genre: "News", timeslot_id: mon9.id)
rhop = Show.find_or_create_by(title: "Real Housewives of Potomac", genre: "Reality", timeslot_id: sun8.id)
# sh6 = Show.create(title: Faker::Book.title, genre: Faker::Book.genre, timeslot_id: tue9.id)
shameless = Show.find_or_create_by(title: "Shameless", genre: "Drama", timeslot_id: sun9.id)

JoinUsertimeslot.find_or_create_by(user_id: pey.id, timeslot_id: sun8.id, show_id: rhop.id)
JoinUsertimeslot.find_or_create_by(user_id: ris.id, timeslot_id: sun9.id, show_id: shameless.id)
JoinUsertimeslot.find_or_create_by(user_id: ris.id, timeslot_id: mon8.id, show_id: bach.id)
JoinUsertimeslot.find_or_create_by(user_id: ris.id, timeslot_id: mon9.id, show_id: rmaddow.id)
JoinUsertimeslot.find_or_create_by(user_id: germ.id, timeslot_id: mon9.id, show_id: rmaddow.id)
JoinUsertimeslot.find_or_create_by(user_id: oprah.id, timeslot_id: sun9.id, show_id: got.id)

