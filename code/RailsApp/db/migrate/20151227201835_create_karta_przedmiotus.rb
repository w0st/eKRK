class CreateKartaPrzedmiotus < ActiveRecord::Migration
  def change
    create_table :karta_przedmiotus do |t|
      t.string :wersjaJezykowa

      t.timestamps
    end
  end
end
