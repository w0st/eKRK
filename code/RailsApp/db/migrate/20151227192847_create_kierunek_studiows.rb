class CreateKierunekStudiows < ActiveRecord::Migration
  def change
    create_table :kierunek_studiows do |t|
      t.string :nazwaKierunku

      t.timestamps
    end
  end
end
