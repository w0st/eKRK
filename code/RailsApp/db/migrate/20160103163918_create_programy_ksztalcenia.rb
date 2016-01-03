class CreateProgramyKsztalcenia < ActiveRecord::Migration
  def change
    create_table :programy_ksztalcenia do |t|
      t.string :specjalonosc
      t.integer :poziomKsztalcenia
      t.integer :forma
      t.integer :profil
      t.string :jezykStudiow
      t.datetime :uchwalony
      t.datetime :obowiazujeOd

      t.timestamps
    end
  end
end
