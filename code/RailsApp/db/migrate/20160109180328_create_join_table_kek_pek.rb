class CreateJoinTableKekPek < ActiveRecord::Migration
  def change
    create_join_table :kierunkowe_efekty_ksztalcenia, :przedmiotowe_efekty_ksztalcenia do |t|
      t.index [:kierunkowy_efekt_ksztalcenia_id, :przedmiotowy_efekt_ksztalcenia_id], unique: true, name: 'kek_pek_index'
      t.index [:przedmiotowy_efekt_ksztalcenia_id, :kierunkowy_efekt_ksztalcenia_id], unique: true, name: 'pek_kek_index'
    end
  end
end
