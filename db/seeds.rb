# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

r1 = Role.create({name: "Agent", description: "Can read and create items. Can update and destroy own items"})
r2 = Role.create({name: "Admin", description: "Can perform any operation on any resource"})

u1 = User.create({name: "David Hayward", login: "davidhayward", email: "david.hayward@inter-act.co.uk", password: "changeme", password_confirmation: "changeme", role_id: r2.id})
u1 = User.create({name: "Kevin", login: "kevin", email: "kevin@inter-act.co.uk", password: "changeme", password_confirmation: "changeme", role_id: r1.id})