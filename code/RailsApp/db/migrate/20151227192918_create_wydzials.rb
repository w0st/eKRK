class CreateWydzials < ActiveRecord::Migration
  def change
    create_table :wydzials do |t|
      t.string :nazwaWydzialu
      t.integer :numer

      t.timestamps
    end
  end
end
