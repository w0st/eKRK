class CreatePracownikNaukowies < ActiveRecord::Migration
  def change
    create_table :pracownik_naukowies do |t|
      t.string :imie
      t.string :nazwisko
      t.string :email

      t.timestamps
    end
  end
end
