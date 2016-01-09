# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
wydzial = Wydzial.create(nazwaWydzialu: 'Informatyki i Zarządzania', numer: 8)
kierunek = KierunekStudiow.create(nazwaKierunku: 'Informatyka', wydzial: wydzial)
programKsztalcenia1 = ProgramKsztalcenia.create(specjalnosc: 'Inżynieria', poziomKsztalcenia: 'DrugiegoStopnia',
                          forma: 'Stacjonarna', profil: 'Ogolnoakademicki', jezykStudiow: 'Polski',
                          kierunek_studiow: kierunek)
ProgramKsztalcenia.create(specjalnosc: 'ISI', poziomKsztalcenia: 'DrugiegoStopnia',
                          forma: 'Stacjonarna', profil: 'Ogolnoakademicki', jezykStudiow: 'Polski',
                          kierunek_studiow: kierunek)
ProgramKsztalcenia.create(specjalnosc: 'Technologie mobilne', poziomKsztalcenia: 'DrugiegoStopnia',
                          forma: 'Stacjonarna', profil: 'Ogolnoakademicki', jezykStudiow: 'Polski',
                          kierunek_studiow: kierunek)

# PlanyStudiow
planStudiow = PlanStudiow.create(program_ksztalcenia: programKsztalcenia1)

# Semestry
semestr2 = Semestr.create(numer: 2, plan_studiow: planStudiow)

# ObszaryKsztalcenia
obszarNaukTechnicznych = ObszarKsztalcenia.create(nazwaObszaru: 'Nauk Technicznych')

# ObszaroweEfektyKsztalcenia
oek1 = ObszarowyEfektKsztalcenia.create(kod:'T2A_W03' ,opis:'Opis T2A_W03' ,kategoria: 'Wiedza',
                                        stopien: 'DrugiegoStopnia', profil: 'Ogolnoakademicki',
                                        obszar_ksztalcenia: obszarNaukTechnicznych)
oek2 = ObszarowyEfektKsztalcenia.create(kod:'T2A_W04' ,opis:'Opis T2A_W04' ,kategoria: 'Umiejetnosci',
                                        stopien: 'DrugiegoStopnia', profil: 'Praktyczny',
                                        obszar_ksztalcenia: obszarNaukTechnicznych)

# KierunkoweEfektyKsztalcenia
kek1 = KierunkowyEfektKsztalcenia.create(kod:'K2INF_W03',opis: 'Opis K2INF_W03',kategoria: 'Wiedza',
                                         program_ksztalcenia: programKsztalcenia1)
kek2 = KierunkowyEfektKsztalcenia.create(kod:'K2INF_W04',opis: 'Opis K2INF_W04',kategoria: 'Umiejetnosci',
                                         program_ksztalcenia: programKsztalcenia1)

oek1.kierunkowe_efekty_ksztalcenia << kek1
oek1.kierunkowe_efekty_ksztalcenia << kek2

# PrzedmiotoweEfektyKsztalcenia
# TODO dodac referencje do karty przedmiotu
pek1 = PrzedmiotowyEfektKsztalcenia.create(kod: 'P2INF_W03', opis: 'Opis P2INF_W03', kategoria: 'Wiedza')

kek1.przedmiotowe_efekty_ksztalcenia << pek1

# UdzialyObszarow
udzialObszaru1 = UdzialObszaru.create(udzialObszaru: 1.0, obszar_ksztalcenia: obszarNaukTechnicznych,
                                      program_ksztalcenia: programKsztalcenia1)
# ProgramyStudiow
programStudiow1 = ProgramStudiow.create(zwiazekZMisjaUczelni: 'Opis1' ,wymaganiaWstepne: 'Opis2',
                                        uzyskiwanyTytul: 'Magister', sylwetkaAbsolwenta: 'Opis3',
                                        liczbaSemestrow: 3, ECTSdoKwalifikacji: 90 ,mozliwoscKontynuacjiStudiow: 'Opis4',
                                        zwiezlaAnalizaZRynkiem: 'Opis5', program_ksztalcenia: programKsztalcenia1)

# ZagadnianiaEgzaminyDyplomowego
zagadnieED1 = ZagadnienieEgzaminuDyplomowego.create(zagadnienie: 'Opis 1',program_studiow: programStudiow1)

#Konto administratora
  #po rake db:setup
  #leci mi
  #LoadError: cannot load such file -- bcrypt_ext
#User.create(email: 'admin@example.com', password: 'admin1234', password_confirmation: 'admin1234',
#           role: 1)