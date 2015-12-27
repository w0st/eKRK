class CreateSemestrs < ActiveRecord::Migration
  def change
    create_table :semestrs do |t|
      t.integer :numer

      t.timestamps
    end
  end
end
