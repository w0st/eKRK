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

ActiveRecord::Schema.define(version: 20160208164241) do

  create_table "emp_data", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "karty_przedmiotow", force: :cascade do |t|
    t.string   "wersjaJezykowa"
    t.integer  "przedmiot_ksztalcenia_id"
    t.integer  "pracownik_naukowy_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "karty_przedmiotow", ["pracownik_naukowy_id"], name: "index_karty_przedmiotow_on_pracownik_naukowy_id"
  add_index "karty_przedmiotow", ["przedmiot_ksztalcenia_id"], name: "index_karty_przedmiotow_on_przedmiot_ksztalcenia_id"

  create_table "kierunki_studiow", force: :cascade do |t|
    t.string   "nazwaKierunku"
    t.integer  "wydzial_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "kierunki_studiow", ["wydzial_id"], name: "index_kierunki_studiow_on_wydzial_id"

  create_table "kierunkowe_efekty_ksztalcenia", force: :cascade do |t|
    t.string   "kod"
    t.string   "opis"
    t.integer  "kategoria"
    t.integer  "program_ksztalcenia_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "kierunkowe_efekty_ksztalcenia", ["program_ksztalcenia_id"], name: "index_kierunkowe_efekty_ksztalcenia_on_program_ksztalcenia_id"

  create_table "kierunkowe_efekty_ksztalcenia_obszarowe_efekty_ksztalcenia", id: false, force: :cascade do |t|
    t.integer "obszarowy_efekt_ksztalcenia_id",  null: false
    t.integer "kierunkowy_efekt_ksztalcenia_id", null: false
  end

  add_index "kierunkowe_efekty_ksztalcenia_obszarowe_efekty_ksztalcenia", ["kierunkowy_efekt_ksztalcenia_id", "obszarowy_efekt_ksztalcenia_id"], name: "kek_oek_index", unique: true
  add_index "kierunkowe_efekty_ksztalcenia_obszarowe_efekty_ksztalcenia", ["obszarowy_efekt_ksztalcenia_id", "kierunkowy_efekt_ksztalcenia_id"], name: "oek_kek_index", unique: true

  create_table "kierunkowe_efekty_ksztalcenia_przedmiotowe_efekty_ksztalcenia", id: false, force: :cascade do |t|
    t.integer "kierunkowy_efekt_ksztalcenia_id",   null: false
    t.integer "przedmiotowy_efekt_ksztalcenia_id", null: false
  end

  add_index "kierunkowe_efekty_ksztalcenia_przedmiotowe_efekty_ksztalcenia", ["kierunkowy_efekt_ksztalcenia_id", "przedmiotowy_efekt_ksztalcenia_id"], name: "kek_pek_index", unique: true
  add_index "kierunkowe_efekty_ksztalcenia_przedmiotowe_efekty_ksztalcenia", ["przedmiotowy_efekt_ksztalcenia_id", "kierunkowy_efekt_ksztalcenia_id"], name: "pek_kek_index", unique: true

  create_table "kierunkowe_efekty_ksztalcenia_przedmioty_ksztalcenia", id: false, force: :cascade do |t|
    t.integer "kierunkowy_efekt_ksztalcenia_id", null: false
    t.integer "przedmiot_ksztalcenia_id",        null: false
  end

  add_index "kierunkowe_efekty_ksztalcenia_przedmioty_ksztalcenia", ["kierunkowy_efekt_ksztalcenia_id", "przedmiot_ksztalcenia_id"], name: "kek_pk_index", unique: true
  add_index "kierunkowe_efekty_ksztalcenia_przedmioty_ksztalcenia", ["przedmiot_ksztalcenia_id", "kierunkowy_efekt_ksztalcenia_id"], name: "pk_kek_index", unique: true

  create_table "moduly_ksztalcenia", force: :cascade do |t|
    t.string   "nazwaModulu"
    t.integer  "typ"
    t.integer  "minEcts"
    t.integer  "program_studiow_id"
    t.integer  "profil_modulu_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "moduly_ksztalcenia", ["profil_modulu_id"], name: "index_moduly_ksztalcenia_on_profil_modulu_id"
  add_index "moduly_ksztalcenia", ["program_studiow_id"], name: "index_moduly_ksztalcenia_on_program_studiow_id"

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.text     "redirect_uri",              null: false
    t.string   "scopes",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true

  create_table "obszarowe_efekty_ksztalcenia", force: :cascade do |t|
    t.string   "kod"
    t.string   "opis"
    t.integer  "kategoria"
    t.integer  "stopien"
    t.integer  "profil"
    t.integer  "obszar_ksztalcenia_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "obszarowe_efekty_ksztalcenia", ["obszar_ksztalcenia_id"], name: "index_obszarowe_efekty_ksztalcenia_on_obszar_ksztalcenia_id"

  create_table "obszary_ksztalcenia", force: :cascade do |t|
    t.string   "nazwaObszaru"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plany_studiow", force: :cascade do |t|
    t.integer  "program_ksztalcenia_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "plany_studiow", ["program_ksztalcenia_id"], name: "index_plany_studiow_on_program_ksztalcenia_id"

  create_table "pracownicy_naukowi", force: :cascade do |t|
    t.string   "imie"
    t.string   "nazwisko"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profile_modulow", force: :cascade do |t|
    t.string   "nazwa"
    t.integer  "program_studiow_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "profile_modulow", ["program_studiow_id"], name: "index_profile_modulow_on_program_studiow_id"

  create_table "programy_ksztalcenia", force: :cascade do |t|
    t.string   "specjalnosc"
    t.integer  "poziomKsztalcenia"
    t.integer  "forma"
    t.integer  "profil"
    t.string   "jezykStudiow"
    t.datetime "uchwalony"
    t.datetime "obowiazujeOd"
    t.integer  "kierunek_studiow_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "programy_ksztalcenia", ["kierunek_studiow_id"], name: "index_programy_ksztalcenia_on_kierunek_studiow_id"

  create_table "programy_studiow", force: :cascade do |t|
    t.string   "zwiazekZMisjaUczelni"
    t.string   "wymaganiaWstepne"
    t.integer  "uzyskiwanyTytul"
    t.string   "sylwetkaAbsolwenta"
    t.integer  "liczbaSemestrow"
    t.integer  "ECTSdoKwalifikacji"
    t.string   "mozliwoscKontynuacjiStudiow"
    t.string   "zwiezlaAnalizaZRynkiem"
    t.integer  "program_ksztalcenia_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "programy_studiow", ["program_ksztalcenia_id"], name: "index_programy_studiow_on_program_ksztalcenia_id"

  create_table "przedmiotowe_efekty_ksztalcenia", force: :cascade do |t|
    t.string   "kod"
    t.string   "opis"
    t.integer  "kategoria"
    t.integer  "karta_przedmiotu_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "przedmiotowe_efekty_ksztalcenia", ["karta_przedmiotu_id"], name: "index_przedmiotowe_efekty_ksztalcenia_on_karta_przedmiotu_id"

  create_table "przedmioty_ksztalcenia", force: :cascade do |t|
    t.string   "nazwaPrzedmiotu"
    t.integer  "program_ksztalcenia_id"
    t.integer  "pracownik_naukowy_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "przedmioty_ksztalcenia", ["pracownik_naukowy_id"], name: "index_przedmioty_ksztalcenia_on_pracownik_naukowy_id"
  add_index "przedmioty_ksztalcenia", ["program_ksztalcenia_id"], name: "index_przedmioty_ksztalcenia_on_program_ksztalcenia_id"

  create_table "semestry", force: :cascade do |t|
    t.integer  "numer"
    t.integer  "plan_studiow_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "semestry", ["plan_studiow_id"], name: "index_semestry_on_plan_studiow_id"

  create_table "udzialy_obszarow", force: :cascade do |t|
    t.decimal  "udzialObszaru"
    t.integer  "obszar_ksztalcenia_id"
    t.integer  "program_ksztalcenia_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "udzialy_obszarow", ["obszar_ksztalcenia_id"], name: "index_udzialy_obszarow_on_obszar_ksztalcenia_id"
  add_index "udzialy_obszarow", ["program_ksztalcenia_id"], name: "index_udzialy_obszarow_on_program_ksztalcenia_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "role",                   default: 0,  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "wydzialy", force: :cascade do |t|
    t.string   "nazwaWydzialu"
    t.integer  "numer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "zagadnienia_egzaminu_dyplomowego", force: :cascade do |t|
    t.string   "zagadnienie"
    t.integer  "program_studiow_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "zagadnienia_egzaminu_dyplomowego", ["program_studiow_id"], name: "index_zagadnienia_egzaminu_dyplomowego_on_program_studiow_id"

  create_table "zajecia", force: :cascade do |t|
    t.string   "kodZajec"
    t.string   "nazwaZajec"
    t.integer  "punktyECTS"
    t.integer  "punktyECTSBK"
    t.integer  "punktyECTSP"
    t.integer  "sposobZaliczenia"
    t.boolean  "czyOgolnouczelniany"
    t.integer  "rodzaj"
    t.integer  "typ"
    t.integer  "modul_ksztalcenia_id"
    t.integer  "semestr_id"
    t.integer  "przedmiot_ksztalcenia_id"
    t.integer  "formaKursu"
    t.integer  "godzinyZZU"
    t.integer  "godzinyCNPS"
    t.integer  "grupa_kursow_id"
    t.integer  "kurs_koncowy_id"
    t.string   "type"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "zajecia", ["grupa_kursow_id"], name: "index_zajecia_on_grupa_kursow_id"
  add_index "zajecia", ["kodZajec"], name: "kod_unique", unique: true
  add_index "zajecia", ["kurs_koncowy_id"], name: "index_zajecia_on_kurs_koncowy_id"
  add_index "zajecia", ["modul_ksztalcenia_id"], name: "index_zajecia_on_modul_ksztalcenia_id"
  add_index "zajecia", ["przedmiot_ksztalcenia_id"], name: "index_zajecia_on_przedmiot_ksztalcenia_id"
  add_index "zajecia", ["semestr_id"], name: "index_zajecia_on_semestr_id"

end
