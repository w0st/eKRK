class CreatePrzedmiotoweEfektyKsztalcenia < ActiveRecord::Migration
  def change
    create_table :przedmiotowe_efekty_ksztalcenia do |t|
      t.string :kod
      t.string :opis
      t.integer :kategoria

      t.timestamps
    end
  end
end
