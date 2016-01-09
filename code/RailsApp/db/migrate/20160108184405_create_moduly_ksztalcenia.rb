class CreateModulyKsztalcenia < ActiveRecord::Migration
  def change
    create_table :moduly_ksztalcenia do |t|
      t.string :nazwaModulu
      t.integer :typ
      t.integer :minEcts
      t.references :program_studiow, index: true, foreign_key: true
      t.references :profil_modulu, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
