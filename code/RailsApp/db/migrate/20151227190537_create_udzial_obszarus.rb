class CreateUdzialObszarus < ActiveRecord::Migration
  def change
    create_table :udzial_obszarus do |t|
      t.decimal :udzialObszaru

      t.timestamps
    end
  end
end
