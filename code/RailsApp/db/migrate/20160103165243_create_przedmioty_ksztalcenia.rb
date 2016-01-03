class CreatePrzedmiotyKsztalcenia < ActiveRecord::Migration
  def change
    create_table :przedmioty_ksztalcenia do |t|
      t.string :nazwaPrzedmiotu

      t.timestamps
    end
  end
end
