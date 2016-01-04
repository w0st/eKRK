class DropTables < ActiveRecord::Migration
  def change
    drop_table :forma_kursus
    drop_table :karta_przedmiotus
    drop_table :kierunek_studiows
    drop_table :kierunkowy_efekt_ksztalcenia
    drop_table :kurs_zajecia
    drop_table :modul_ksztalcenia
    drop_table :obszarowy_efekt_ksztalcenia
    drop_table :obszar_ksztalcenia
    drop_table :plan_studiows
    drop_table :pracownik_naukowies
    drop_table :profil_modulus
    drop_table :program_ksztalcenia
    drop_table :program_studiows
    drop_table :przedmiot_ksztalcenia
    drop_table :przedmiotowy_efekt_ksztalcenia
    drop_table :semestrs
    drop_table :udzial_obszarus
    drop_table :wydzials
    drop_table :zagadnienie_egzaminu_dyplomowegos
  end
end
