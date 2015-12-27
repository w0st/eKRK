class PrzedmiotowyEfektKsztalcenia < ActiveRecord::Base
  has_and_belongs_to_many :kierunkowy_efekt_ksztalcenias
  belongs_to :karta_przedmiotu

  enum kategoria: {
      Wiedza: 0,
      Umiejetnosci: 1,
      Kompetencje: 2
  }
end
