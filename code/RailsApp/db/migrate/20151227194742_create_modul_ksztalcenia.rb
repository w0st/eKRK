class CreateModulKsztalcenia < ActiveRecord::Migration
  def change
    create_table :modul_ksztalcenia do |t|
      t.string :nazwaModulu
      t.integer :typ
      t.integer :minEcts

      t.timestamps
    end
  end
end
