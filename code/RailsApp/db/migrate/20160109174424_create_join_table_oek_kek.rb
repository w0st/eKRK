class CreateJoinTableOekKek < ActiveRecord::Migration
  def change
    create_join_table :obszarowe_efekty_ksztalcenia, :kierunkowe_efekty_ksztalcenia do |t|
      t.index [:obszarowy_efekt_ksztalcenia_id, :kierunkowy_efekt_ksztalcenia_id], unique: true, name: 'oek_kek_index'
      t.index [:kierunkowy_efekt_ksztalcenia_id, :obszarowy_efekt_ksztalcenia_id], unique: true, name: 'kek_oek_index'
    end
  end
end
