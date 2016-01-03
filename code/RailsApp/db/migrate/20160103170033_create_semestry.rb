class CreateSemestry < ActiveRecord::Migration
  def change
    create_table :semestry do |t|
      t.integer :numer

      t.timestamps
    end
  end
end
