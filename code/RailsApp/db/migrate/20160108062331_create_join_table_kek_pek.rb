class CreateJoinTableKekPek < ActiveRecord::Migration
  def change
    create_join_table :kierunkowe_efekty_ksztalcenia, :przedmiotowe_efekty_ksztalcenia do |t|
      # t.index [:kierunkowy_efekt_ksztalcenia_id, :przedmiotowy_efekt_ksztalcenia_id]
      # t.index [:przedmiotowy_efekt_ksztalcenia_id, :kierunkowy_efekt_ksztalcenia_id]
    end
  end
end
