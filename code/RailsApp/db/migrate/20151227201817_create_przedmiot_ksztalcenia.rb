class CreatePrzedmiotKsztalcenia < ActiveRecord::Migration
  def change
    create_table :przedmiot_ksztalcenia do |t|
      t.string :nazwaPrzedmiotu

      t.timestamps
    end
  end
end
