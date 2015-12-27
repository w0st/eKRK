class KierunkowyEfektKsztalcenia < ActiveRecord::Base

  has_and_belongs_to_many :przedmiotowy_efekt_ksztalcenias
  has_and_belongs_to_many :obszarowy_efekt_ksztalcenias
  has_and_belongs_to_many :przedmiot_ksztalcenias


  enum kategoria: {
      Wiedza: 0,
      Umiejetnosci: 1,
      Kompetencje: 2
  }
end
