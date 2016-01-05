class CreateKierunkiStudiow < ActiveRecord::Migration
  def change
    create_table :kierunki_studiow do |t|
      t.string :nazwaKierunku
      t.references :wydzial, index: true

      t.timestamps
    end
  end
end
