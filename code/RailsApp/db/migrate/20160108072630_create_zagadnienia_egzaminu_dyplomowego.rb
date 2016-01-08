class CreateZagadnieniaEgzaminuDyplomowego < ActiveRecord::Migration
  def change
    create_table :zagadnienia_egzaminu_dyplomowego do |t|
      t.string :zagadnienie
      t.references :program_studiow, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
