class CreateProgramyStudiow < ActiveRecord::Migration
  def change
    create_table :programy_studiow do |t|
      t.string :zwiazekZMisjaUczelni
      t.string :wymaganiaWstepne
      t.integer :uzyskiwanyTytul
      t.string :sylwetkaAbsolwenta
      t.integer :liczbaSemestrow
      t.integer :ECTSdoKwalifikacji
      t.string :mozliwoscKontynuacjiStudiow
      t.string :zwiezlaAnalizaZRynkiem
      t.references :program_ksztalcenia, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
