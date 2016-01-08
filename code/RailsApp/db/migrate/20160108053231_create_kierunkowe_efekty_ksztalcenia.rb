class CreateKierunkoweEfektyKsztalcenia < ActiveRecord::Migration
  def change
    create_table :kierunkowe_efekty_ksztalcenia do |t|
      t.string :kod
      t.string :opis
      t.integer :kategoria
      t.references :program_ksztalcenia, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
