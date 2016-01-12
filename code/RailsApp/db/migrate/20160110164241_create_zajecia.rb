class CreateZajecia < ActiveRecord::Migration
  def change
    create_table :zajecia do |t|
      t.string :kodZajec
      t.string :nazwaZajec
      t.integer :punktyECTS
      t.integer :punktyECTSBK
      t.integer :punktyECTSP
      t.integer :sposobZaliczenia
      t.boolean :czyOgolnouczelniany
      t.integer :rodzaj
      t.integer :typ
      t.references :modul_ksztalcenia, index: true, foreign_key: true
      t.references :semestr, index: true, foreign_key: true
      t.references :przedmiot_ksztalcenia, index: true, foreign_key: true
      t.integer :formaKursu
      t.integer :godzinyZZU
      t.integer :godzinyCNPS
      t.references :zajecia, index: true, foreign_key: true
      t.string :type

      t.timestamps null: false
    end
  end
end
