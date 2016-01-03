class CreatePracownicyNaukowi < ActiveRecord::Migration
  def change
    create_table :pracownicy_naukowi do |t|
      t.string :imie
      t.string :nazwisko
      t.string :email

      t.timestamps
    end
  end
end
