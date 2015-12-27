class CreateKursZajecia < ActiveRecord::Migration
  def change
    create_table :kurs_zajecia do |t|
      t.integer :formaKursu
      t.integer :godzinyZZU
      t.integer :godzinyCNPS

      t.timestamps
    end
  end
end
