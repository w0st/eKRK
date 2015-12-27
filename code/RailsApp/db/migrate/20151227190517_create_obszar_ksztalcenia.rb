class CreateObszarKsztalcenia < ActiveRecord::Migration
  def change
    create_table :obszar_ksztalcenia do |t|
      t.string :nazwaObszaru

      t.timestamps
    end
  end
end
