class CreatePrzedmiotoweEfektyKsztalcenia < ActiveRecord::Migration
  def change
    create_table :przedmiotowe_efekty_ksztalcenia do |t|
      t.string :kod
      t.string :opis
      t.integer :kategoria
      t.references :karta_przedmiotu, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
