class CreateKierunkoweEfektyKsztalcenia < ActiveRecord::Migration
  def change
    create_table :kierunkowe_efekty_ksztalcenia do |t|
      t.string :kod
      t.string :opis
      t.integer :kategoria

      t.timestamps
    end
  end
end
