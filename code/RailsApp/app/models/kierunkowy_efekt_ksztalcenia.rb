class KierunkowyEfektKsztalcenia < ActiveRecord::Base

  has_and_belongs_to_many :przedmiotowe_efekty_ksztalcenia
  has_and_belongs_to_many :obszarowe_efekty_ksztalcenia
  has_and_belongs_to_many :przedmioty_ksztalcenia


  enum kategoria: {
      Wiedza: 0,
      Umiejetnosci: 1,
      Kompetencje: 2
  }
end
