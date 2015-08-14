# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

r1 = Role.create({name: "Admin", description: "Can perform any operation on any resource"})
r2 = Role.create({name: "Agent", description: "Can read and create items. Can update and destroy own items"})


u1 = User.create({name: "Admin Account", login: "admin", email: "admin@inter-act.co.uk", lp_name: "", password: "changeme", password_confirmation: "changeme", role_id: r1.id})
u2 = User.create({name: "David Hayward", login: "davidhayward", email: "david.hayward@inter-act.co.uk", lp_name: "int-David Hayward", password: "changeme", password_confirmation: "changeme", role_id: r1.id})
u3 = User.create({name: "Ali Yashab", login: "aliyashab", email: "ali.yashab@inter-act.co.uk", lp_name: "int-Ali Yashab", password: "changeme", password_confirmation: "changeme", role_id: r1.id})

t1 = Timesheet.create({for_date: "2015-08-05", start_time: "2015-08-05 15:53:40", finish_time: "2015-08-05 19:51:21", user_id: u2.id})
t2 = Timesheet.create({for_date: "2015-08-06", start_time: "2015-08-06 07:33:40", finish_time: "2015-08-06 16:51:21", user_id: u2.id})
t3 = Timesheet.create({for_date: "2015-08-07", start_time: "2015-08-07 07:53:40", finish_time: "2015-08-07 15:51:21", user_id: u2.id})
t4 = Timesheet.create({for_date: "2015-08-08", start_time: "2015-08-08 07:19:10", finish_time: "2015-08-08 12:51:21", user_id: u2.id})

b1 = Break.create({for_date: "2015-08-05", start_time: "2015-08-05 12:01:52", finish_time: "2015-08-05 12:22:52", duration: "1260", break_type: "1", timesheet_id: t1.id})
b2 = Break.create({for_date: "2015-08-05", start_time: "2015-08-05 14:01:52", finish_time: "2015-08-05 14:21:52", duration: "1200", break_type: "1", timesheet_id: t1.id})
b3 = Break.create({for_date: "2015-08-06", start_time: "2015-08-06 12:01:52", finish_time: "2015-08-06 12:22:52", duration: "1260", break_type: "1", timesheet_id: t2.id})
b4 = Break.create({for_date: "2015-08-06", start_time: "2015-08-06 14:01:52", finish_time: "2015-08-06 14:21:52", duration: "1200", break_type: "2", timesheet_id: t2.id})
b5 = Break.create({for_date: "2015-08-07", start_time: "2015-08-06 15:01:52", finish_time: "2015-08-06 15:02:52", duration: "60", break_type: "1", timesheet_id: t2.id})
b6 = Break.create({for_date: "2015-08-07", start_time: "2015-08-07 12:01:52", finish_time: "2015-08-07 12:03:52", duration: "120", break_type: "1", timesheet_id: t3.id})
b7 = Break.create({for_date: "2015-08-07", start_time: "2015-08-07 12:01:52", finish_time: "2015-08-07 12:21:52", duration: "1200", break_type: "1", timesheet_id: t3.id})
b8 = Break.create({for_date: "2015-08-08", start_time: "2015-08-08 12:01:52", finish_time: "2015-08-08 12:11:52", duration: "600", break_type: "2", timesheet_id: t4.id})