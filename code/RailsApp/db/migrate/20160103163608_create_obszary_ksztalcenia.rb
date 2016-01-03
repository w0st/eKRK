class CreateObszaryKsztalcenia < ActiveRecord::Migration
  def change
    create_table :obszary_ksztalcenia do |t|
      t.string :nazwaObszaru

      t.timestamps
    end
  end
end
