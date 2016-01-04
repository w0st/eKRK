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

ActiveRecord::Schema.define(version: 20160104173401) do

  create_table "emp_data", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "karty_przedmiotow", force: true do |t|
    t.string   "wersjaJezykowa"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kierunki_studiow", force: true do |t|
    t.string   "nazwaKierunku"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kierunkowe_efekty_ksztalcenia", force: true do |t|
    t.string   "kod"
    t.string   "opis"
    t.integer  "kategoria"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "moduly_ksztalcenia", force: true do |t|
    t.string   "nazwaModulu"
    t.integer  "typ"
    t.integer  "minEcts"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "obszarowe_efekty_ksztalcenia", force: true do |t|
    t.string   "kod"
    t.string   "opis"
    t.integer  "kategoria"
    t.integer  "stopien"
    t.integer  "profil"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "obszary_ksztalcenia", force: true do |t|
    t.string   "nazwaObszaru"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plany_studiow", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pracownicy_naukowi", force: true do |t|
    t.string   "imie"
    t.string   "nazwisko"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profile_modulow", force: true do |t|
    t.string   "nazwa"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programy_ksztalcenia", force: true do |t|
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

  create_table "programy_studiow", force: true do |t|
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

  create_table "przedmiotowe_efekty_ksztalcenia", force: true do |t|
    t.string   "kod"
    t.string   "opis"
    t.integer  "kategoria"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "przedmioty_ksztalcenia", force: true do |t|
    t.string   "nazwaPrzedmiotu"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "semestry", force: true do |t|
    t.integer  "numer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "udzialy_obszarow", force: true do |t|
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

  create_table "wydzialy", force: true do |t|
    t.string   "nazwaWydzialu"
    t.integer  "numer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "zagadnienia_egzaminu_dyplomowego", force: true do |t|
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
