class CreateJoinTableKekPrzedmiotKsztalcenia < ActiveRecord::Migration
  def change
    create_join_table :kierunkowe_efekty_ksztalcenia, :przedmioty_ksztalcenia do |t|
      t.index [:kierunkowy_efekt_ksztalcenia_id, :przedmiot_ksztalcenia_id], unique: true,  name: 'kek_pk_index'
      t.index [:przedmiot_ksztalcenia_id, :kierunkowy_efekt_ksztalcenia_id], unique: true,  name: 'pk_kek_index'
    end
  end
end
