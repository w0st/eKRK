class CreateProgramyKsztalcenia < ActiveRecord::Migration
  def change
    create_table :programy_ksztalcenia do |t|
      t.string :specjalnosc
      t.integer :poziomKsztalcenia
      t.integer :forma
      t.integer :profil
      t.string :jezykStudiow
      t.datetime :uchwalony
      t.datetime :obowiazujeOd
      t.references :kierunek_studiow, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
