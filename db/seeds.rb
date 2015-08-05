# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

r1 = Role.create({name: "Agent", description: "Can read and create items. Can update and destroy own items"})
r2 = Role.create({name: "Admin", description: "Can perform any operation on any resource"})

u1 = User.create({name: "David Hayward", login: "davidhayward", email: "david.hayward@inter-act.co.uk", lp_name: "int-David Hayward", password: "changeme", password_confirmation: "changeme", role_id: r2.id})
u1 = User.create({name: "Ali Yashab", login: "aliyashab", email: "ali.yashab@inter-act.co.uk", lp_name: "int-Ali Yashab", password: "changeme", password_confirmation: "changeme", role_id: r1.id})