class CreateSemestry < ActiveRecord::Migration
  def change
    create_table :semestry do |t|
      t.integer :numer
      t.references :plan_studiow, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
