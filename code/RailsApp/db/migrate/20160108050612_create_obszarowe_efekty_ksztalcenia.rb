class CreateObszaroweEfektyKsztalcenia < ActiveRecord::Migration
  def change
    create_table :obszarowe_efekty_ksztalcenia do |t|
      t.string :kod
      t.string :opis
      t.integer :kategoria
      t.integer :stopien
      t.integer :profil
      t.references :obszar_ksztalcenia, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
