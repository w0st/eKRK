class CreateKartyPrzedmiotow < ActiveRecord::Migration
  def change
    create_table :karty_przedmiotow do |t|
      t.string :wersjaJezykowa
      t.references :przedmiot_ksztalcenia, index: true, foreign_key: true
      t.references :pracownik_naukowy, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
