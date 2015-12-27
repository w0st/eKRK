# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151227203514) do

  create_table "emp_data", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forma_kursus", force: true do |t|
    t.integer  "formaKursu"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "karta_przedmiotus", force: true do |t|
    t.string   "wersjaJezykowa"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kierunek_studiows", force: true do |t|
    t.string   "nazwaKierunku"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kierunkowy_efekt_ksztalcenia", force: true do |t|
    t.string   "kod"
    t.string   "opis"
    t.integer  "kategoria"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kurs_zajecia", force: true do |t|
    t.integer  "formaKursu"
    t.integer  "godzinyZZU"
    t.integer  "godzinyCNPS"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "modul_ksztalcenia", force: true do |t|
    t.string   "nazwaModulu"
    t.integer  "typ"
    t.integer  "minEcts"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "obszar_ksztalcenia", force: true do |t|
    t.string   "nazwaObszaru"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "obszarowy_efekt_ksztalcenia", force: true do |t|
    t.string   "kod"
    t.string   "opis"
    t.integer  "kategoria"
    t.integer  "stopien"
    t.integer  "profil"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plan_studiows", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pracownik_naukowies", force: true do |t|
    t.string   "imie"
    t.string   "nazwisko"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profil_modulus", force: true do |t|
    t.string   "nazwa"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "program_ksztalcenia", force: true do |t|
    t.string   "specjalonosc"
    t.integer  "poziomKsztalcenia"
    t.integer  "forma"
    t.integer  "profil"
    t.string   "jezykStudiow"
    t.datetime "uchwalony"
    t.datetime "obowiazujeOd"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "program_studiows", force: true do |t|
    t.string   "zwiazekZMisjaUczelni"
    t.string   "wymaganiaWstepne"
    t.integer  "uzyskiwanyTytul"
    t.string   "sylwetkaAbsolwenta"
    t.integer  "liczbaSemestrow"
    t.string   "ECTSdoKwalifikacji"
    t.string   "zwiezlaAnalizaZRynkiem"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "przedmiot_ksztalcenia", force: true do |t|
    t.string   "nazwaPrzedmiotu"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "przedmiotowy_efekt_ksztalcenia", force: true do |t|
    t.string   "kod"
    t.string   "opis"
    t.integer  "kategoria"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "semestrs", force: true do |t|
    t.integer  "numer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "udzial_obszarus", force: true do |t|
    t.decimal  "udzialObszaru"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wydzials", force: true do |t|
    t.string   "nazwaWydzialu"
    t.integer  "numer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "zagadnienie_egzaminu_dyplomowegos", force: true do |t|
    t.string   "zagadnienie"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "zajecia", force: true do |t|
    t.string   "kodZajec"
    t.string   "nazwaZajec"
    t.integer  "punktyECTS"
    t.integer  "punktyECTSBK"
    t.integer  "punktyECTSP"
    t.integer  "sposobZaliczenia"
    t.boolean  "czyOgolnouczelniany"
    t.integer  "rodzaj"
    t.integer  "typ"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
