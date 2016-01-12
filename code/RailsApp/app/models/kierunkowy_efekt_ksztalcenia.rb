class KierunkowyEfektKsztalcenia < ActiveRecord::Base

  belongs_to :program_ksztalcenia
  has_and_belongs_to_many :przedmiotowe_efekty_ksztalcenia,
                          :join_table => "kierunkowe_efekty_ksztalcenia_przedmiotowe_efekty_ksztalcenia",
                          :class_name => "PrzedmiotowyEfektKsztalcenia",
                          :uniq => true
  has_and_belongs_to_many :obszarowe_efekty_ksztalcenia,
                          :join_table => "kierunkowe_efekty_ksztalcenia_obszarowe_efekty_ksztalcenia",
                          :class_name => "ObszarowyEfektKsztalcenia",
                          :uniq => true
  has_and_belongs_to_many :przedmioty_ksztalcenia,
                          :join_table => "kierunkowe_efekty_ksztalcenia_przedmioty_ksztalcenia",
                          :class_name => "PrzedmiotKsztalcenia",
                          :uniq => true


  enum kategoria: {
      Wiedza: 0,
      Umiejetnosci: 1,
      Kompetencje: 2
  }
end
