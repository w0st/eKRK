class CreateProfileModulow < ActiveRecord::Migration
  def change
    create_table :profile_modulow do |t|
      t.string :nazwa
      t.references :program_studiow, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
