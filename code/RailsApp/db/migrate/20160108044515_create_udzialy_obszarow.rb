class CreateUdzialyObszarow < ActiveRecord::Migration
  def change
    create_table :udzialy_obszarow do |t|
      t.decimal :udzialObszaru
      t.references :obszar_ksztalcenia, index: true, foreign_key: true
      t.references :program_ksztalcenia, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
