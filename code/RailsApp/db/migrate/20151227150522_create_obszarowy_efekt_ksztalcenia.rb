class CreateObszarowyEfektKsztalcenia < ActiveRecord::Migration
  def change
    create_table :obszarowy_efekt_ksztalcenia do |t|
      t.string :kod
      t.string :opis
      t.integer :kategoria
      t.integer :stopien
      t.integer :profil

      t.timestamps
    end
  end
end
