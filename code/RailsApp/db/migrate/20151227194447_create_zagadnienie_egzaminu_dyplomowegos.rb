class CreateZagadnienieEgzaminuDyplomowegos < ActiveRecord::Migration
  def change
    create_table :zagadnienie_egzaminu_dyplomowegos do |t|
      t.string :zagadnienie

      t.timestamps
    end
  end
end
