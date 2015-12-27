class CreateProfilModulus < ActiveRecord::Migration
  def change
    create_table :profil_modulus do |t|
      t.string :nazwa

      t.timestamps
    end
  end
end
