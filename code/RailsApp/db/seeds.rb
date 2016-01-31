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

# ProfilModulow
profil_modulu1 = ProfilModulu.create(nazwa: 'Kierunkowe', program_studiow: programStudiow1)
profil_modulu2 = ProfilModulu.create(nazwa: 'Kształcenia ogólnego', program_studiow: programStudiow1)

# ModulKsztalcenia
modul_ksztalcenia1 = ModulKsztalcenia.create(nazwaModulu: 'Technologie informacyjne', typ: 'Obowiazkowy', minEcts: 9, program_studiow: programStudiow1, profil_modulu: profil_modulu1)
modul_ksztalcenia2 = ModulKsztalcenia.create(nazwaModulu: 'Języki obce', typ: 'Obowiazkowy', minEcts: 9, program_studiow: programStudiow1, profil_modulu: profil_modulu2)
modul_ksztalcenia3 = ModulKsztalcenia.create(nazwaModulu: 'Modul wybieralny1', typ: 'Opcjonalny', minEcts: 9, program_studiow: programStudiow1, profil_modulu: profil_modulu1)
modul_ksztalcenia4 = ModulKsztalcenia.create(nazwaModulu: 'Przedmioty managerskie', typ: 'Opcjonalny', minEcts: 9, program_studiow: programStudiow1, profil_modulu: profil_modulu2)



# PracownikNaukowy
pracownik_naukowy1 = PracownikNaukowy.create(imie: 'Janusz', nazwisko: 'Martan', email: 'janusz.martan@pwr.wroc.pl')

# PrzedmiotKsztalcenia
przedmiotKsztalcenia1 = PrzedmiotKsztalcenia.create(nazwaPrzedmiotu: 'Podstawy elektroniki i miernictwa', program_ksztalcenia: programKsztalcenia1,opiekunPrzedmiotu: pracownik_naukowy1 )
przedmiotKsztalcenia1.kierunkowe_efekty_ksztalcenia << kek1
przedmiotKsztalcenia1.kierunkowe_efekty_ksztalcenia << kek2


# KartaPrzedmiotu
kartaPrzedmiotu1PL = KartaPrzedmiotu.create(wersjaJezykowa: 'PL', przedmiot_ksztalcenia: przedmiotKsztalcenia1, autorKartyPrzedmiotu: pracownik_naukowy1)
kartaPrzedmiotu1ENG = KartaPrzedmiotu.create(wersjaJezykowa: 'ENG', przedmiot_ksztalcenia: przedmiotKsztalcenia1, autorKartyPrzedmiotu: pracownik_naukowy1)

kartaPrzedmiotu1PL.przedmiotowe_efekty_ksztalcenia << pek1

# Zajecia
gk1 = GrupaKursow.create(kodZajec: 'IZN001516WL',nazwaZajec: 'Podstawy elektroniki i miernictwa GK',
                   punktyECTS: 2,punktyECTSBK: 3,punktyECTSP: 2,sposobZaliczenia: 'Zaliczenie',
                   czyOgolnouczelniany: FALSE, rodzaj: 'Podstawowy',
                   typ: 'Obowiazkowy',modul_ksztalcenia: modul_ksztalcenia1, semestr: semestr2, przedmiot_ksztalcenia: przedmiotKsztalcenia1)

kurs1 = Kurs.create(formaKursu: 'Wyklad', godzinyZZU: 30, godzinyCNPS: 60, modul_ksztalcenia: modul_ksztalcenia1, semestr: semestr2)
kurs2 = Kurs.create(formaKursu: 'Laboratorium', godzinyZZU: 30, godzinyCNPS: 60, modul_ksztalcenia: modul_ksztalcenia1, semestr: semestr2)

gk1.kursy << kurs1
gk1.kursy << kurs2

gk1.kurs_koncowy = kurs1


#Konto administratora
User.create(email: 'admin@example.com', password: 'admin1234', password_confirmation: 'admin1234',
           role: 1)
# Konta uzytkownikow
User.create(email: 'user@example.com', password: 'user1234', password_confirmation: 'user1234',
            role: 0)
User.create(email: 'another@example.com', password: 'user1234', password_confirmation: 'user1234',
            role: 0)

#Seed dla OAuth
app = Doorkeeper::Application.create! :name => "Doorkeeper AngularJS Client", :redirect_uri => "http://localhost:8000/"

puts "Application: "
puts "name: #{app.name}"
puts "redirect_uri: #{app.redirect_uri}"
puts "uid: #{app.uid}"
puts "secret: #{app.secret}"
puts "Przepisz uid jako CLIENT_ID do konfiguracji aplikacji Angulara"