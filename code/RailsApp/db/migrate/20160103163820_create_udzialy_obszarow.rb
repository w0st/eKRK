class CreateUdzialyObszarow < ActiveRecord::Migration
  def change
    create_table :udzialy_obszarow do |t|
      t.decimal :udzialObszaru

      t.timestamps
    end
  end
end
