class CreateKartyPrzedmiotow < ActiveRecord::Migration
  def change
    create_table :karty_przedmiotow do |t|
      t.string :wersjaJezykowa

      t.timestamps
    end
  end
end
