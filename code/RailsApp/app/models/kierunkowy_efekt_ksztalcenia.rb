class KierunkowyEfektKsztalcenia < ActiveRecord::Base

  belongs_to :program_ksztalcenia
  has_and_belongs_to_many :przedmiotowe_efekty_ksztalcenia, :join_table => "kierunkowe_efekty_ksztalcenia_przedmiotowe_efekty_ksztalcenia", :class_name => "PrzedmiotowyEfektKsztalcenia"
  has_and_belongs_to_many :obszarowe_efekty_ksztalcenia, :join_table => "kierunkowe_efekty_ksztalcenia_obszarowe_efekty_ksztalcenia", :class_name => "ObszarowyEfektKsztalcenia"
  has_and_belongs_to_many :przedmioty_ksztalcenia


  enum kategoria: {
      Wiedza: 0,
      Umiejetnosci: 1,
      Kompetencje: 2
  }
end
