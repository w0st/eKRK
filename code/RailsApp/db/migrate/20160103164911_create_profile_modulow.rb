class CreateProfileModulow < ActiveRecord::Migration
  def change
    create_table :profile_modulow do |t|
      t.string :nazwa

      t.timestamps
    end
  end
end
