class CreateKierunkowyEfektKsztalcenia < ActiveRecord::Migration
  def change
    create_table :kierunkowy_efekt_ksztalcenia do |t|
      t.string :kod
      t.string :opis
      t.integer :kategoria

      t.timestamps
    end
  end
end
