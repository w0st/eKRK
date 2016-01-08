class CreatePlanyStudiow < ActiveRecord::Migration
  def change
    create_table :plany_studiow do |t|
      t.references :program_ksztalcenia, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
