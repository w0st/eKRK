# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
wydzial = Wydzial.create(nazwaWydzialu: 'Informatyki i Zarządzania', numer: 8)
KierunekStudiow.create(nazwaKierunku: 'Informatyka', wydzial: wydzial)
