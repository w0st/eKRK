class CreateWydzialy < ActiveRecord::Migration
  def change
    create_table :wydzialy do |t|
      t.string :nazwaWydzialu
      t.integer :numer

      t.timestamps
    end
  end
end
