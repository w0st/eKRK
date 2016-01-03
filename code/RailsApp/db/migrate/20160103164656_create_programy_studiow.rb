class CreateProgramyStudiow < ActiveRecord::Migration
  def change
    create_table :programy_studiow do |t|
      t.string :zwiazekZMisjaUczelni
      t.string :wymaganiaWstepne
      t.integer :uzyskiwanyTytul
      t.string :sylwetkaAbsolwenta
      t.integer :liczbaSemestrow
      t.integer :ECTSdoKwalifikacji
      t.string :ECTSdoKwalifikacji
      t.string :zwiezlaAnalizaZRynkiem

      t.timestamps
    end
  end
end
