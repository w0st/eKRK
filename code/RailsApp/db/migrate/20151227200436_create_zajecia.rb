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

      t.timestamps
    end
  end
end
