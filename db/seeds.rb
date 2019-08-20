require 'faker'
require 'pry'
# User.destroy_all
# Timeslot.destroy_all
# Show.destroy_all
# ShowUser.destroy_all

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
wed8 = Timeslot.find_or_create_by(day: 3, start_time: 2000, end_time: 2100)
wed9 = Timeslot.find_or_create_by(day: 3, start_time: 2100, end_time: 2200)
thurs8 = Timeslot.find_or_create_by(day: 4, start_time: 2000, end_time: 2100)
thurs9 = Timeslot.find_or_create_by(day: 4, start_time: 2100, end_time: 2200)
fri8 = Timeslot.find_or_create_by(day: 5, start_time: 2000, end_time: 2100)
fri9 = Timeslot.find_or_create_by(day: 5, start_time: 2100, end_time: 2200)
sat8 = Timeslot.find_or_create_by(day: 6, start_time: 2000, end_time: 2100)
sat9 = Timeslot.find_or_create_by(day: 6, start_time: 2100, end_time: 2200)


simpsons = Show.find_or_create_by(title: "The Simpsons", genre: "Comedy", timeslot_id: sun8.id)
rhop = Show.find_or_create_by(title: "Real Housewives of Potomac", genre: "Reality", timeslot_id: sun8.id)
got = Show.find_or_create_by(title: "Game of Thrones", genre: "Fantasy", timeslot_id: sun9.id)
shameless = Show.find_or_create_by(title: "Shameless", genre: "Drama", timeslot_id: sun9.id)
bach = Show.find_or_create_by(title: "The Bachelorette", genre: "Reality", timeslot_id: mon8.id)
hannah = Show.find_or_create_by(title: "Hannah Montana", genre: "Kids", timeslot_id: mon8.id)
rmaddow = Show.find_or_create_by(title: "The Rachel Maddow Show", genre: "News", timeslot_id: mon9.id)
goodbones = Show.find_or_create_by(title: "Good Bones", genre: "Reality", timeslot_id: mon9.id)
vmars = Show.find_or_create_by(title: "Veronica Mars", genre: "Drama", timeslot_id: tue8.id)
rhoc = Show.find_or_create_by(title: "Real Housewives of Orange County", genre: "Reality", timeslot_id: tue8.id)
belowdeck = Show.find_or_create_by(title: "Below Deck: Mediterannean", genre: "Reality", timeslot_id: tue9.id)
fleabag = Show.find_or_create_by(title: "Fleabag", genre: "Comedy", timeslot_id: tue9.id)
survivor = Show.find_or_create_by(title: "Survivor", genre: "Reality", timeslot_id: wed8.id)
hoarders = Show.find_or_create_by(title: "Hoarders", genre: "Reality", timeslot_id: wed8.id)
cribs = Show.find_or_create_by(title: "Cribs", genre: "Reality", timeslot_id: wed9.id)
flavor = Show.find_or_create_by(title: "Flavor of Love", genre: "Reality", timeslot_id: wed9.id)
greys = Show.find_or_create_by(title: "Grey's Anatomy", genre: "Drama", timeslot_id: thurs8.id)
bbrother = Show.find_or_create_by(title: "Big Brother", genre: "Reality", timeslot_id: thurs8.id)
goodplace = Show.find_or_create_by(title: "The Good Place", genre: "Comedy", timeslot_id: thurs9.id)
rupaul = Show.find_or_create_by(title: "RuPaul's Drag Race", genre: "Reality", timeslot_id: thurs9.id)
parks = Show.find_or_create_by(title: "Parks and Recreation", genre: "Comedy", timeslot_id: fri8.id)
office = Show.find_or_create_by(title: "The Office", genre: "Comedy", timeslot_id: fri8.id)
dexter = Show.find_or_create_by(title: "Dexter", genre: "Thriller", timeslot_id: fri9.id)
arrdev = Show.find_or_create_by(title: "Arrested Development", genre: "Comedy", timeslot_id: fri9.id)
amazrace = Show.find_or_create_by(title: "The Amazing Race", genre: "Reality", timeslot_id: sat8.id)
famguy = Show.find_or_create_by(title: "Family Guy", genre: "Comedy", timeslot_id: sat8.id)
snl = Show.find_or_create_by(title: "Saturday Night Live", genre: "Comedy", timeslot_id: sat9.id)
trueblood = Show.find_or_create_by(title: "True Blood", genre: "Thriller", timeslot_id: sat9.id)




ShowUser.find_or_create_by(user_id: pey.id, show_id: rhop.id)
ShowUser.find_or_create_by(user_id: ris.id, show_id: shameless.id)
ShowUser.find_or_create_by(user_id: ris.id, show_id: bach.id)
ShowUser.find_or_create_by(user_id: ris.id, show_id: rmaddow.id)
ShowUser.find_or_create_by(user_id: germ.id, show_id: rmaddow.id)
ShowUser.find_or_create_by(user_id: oprah.id, show_id: got.id)

# ShowUser.find_or_create_by(user_id: pey.id, timeslot_id: sun8.id, show_id: rhop.id)
# ShowUser.find_or_create_by(user_id: ris.id, timeslot_id: sun9.id, show_id: shameless.id)
# ShowUser.find_or_create_by(user_id: ris.id, timeslot_id: mon8.id, show_id: bach.id)
# ShowUser.find_or_create_by(user_id: ris.id, timeslot_id: mon9.id, show_id: rmaddow.id)
# ShowUser.find_or_create_by(user_id: germ.id, timeslot_id: mon9.id, show_id: rmaddow.id)
# ShowUser.find_or_create_by(user_id: oprah.id, timeslot_id: sun9.id, show_id: got.id)