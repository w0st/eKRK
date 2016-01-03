class CreateZagadnieniaEgzaminuDyplomowego < ActiveRecord::Migration
  def change
    create_table :zagadnienia_egzaminu_dyplomowego do |t|
      t.string :zagadnienie

      t.timestamps
    end
  end
end
