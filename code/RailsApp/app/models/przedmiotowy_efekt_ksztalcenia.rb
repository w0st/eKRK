class PrzedmiotowyEfektKsztalcenia < ActiveRecord::Base
  has_and_belongs_to_many :kierunkowe_efekty_ksztalcenia, :join_table => "kierunkowe_efekty_ksztalcenia_przedmiotowe_efekty_ksztalcenia", :class_name => "KierunkowyEfektKsztalcenia"
  belongs_to :karta_przedmiotu

  enum kategoria: {
      Wiedza: 0,
      Umiejetnosci: 1,
      Kompetencje: 2
  }
end
