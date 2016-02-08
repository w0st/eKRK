class AddIndexToPrzedmiotyKsztalcenia < ActiveRecord::Migration
  def change
    add_index :przedmioty_ksztalcenia, :nazwaPrzedmiotu, unique: true
  end
end
