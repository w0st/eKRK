class CreatePrzedmiotyKsztalcenia < ActiveRecord::Migration
  def change
    create_table :przedmioty_ksztalcenia do |t|
      t.string :nazwaPrzedmiotu
      t.references :program_ksztalcenia, index: true, foreign_key: true
      t.references :pracownik_naukowy, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
