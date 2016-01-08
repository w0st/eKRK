class ObszarowyEfektKsztalcenia < ActiveRecord::Base
  has_and_belongs_to_many :kierunkowe_efekty_ksztalcenia, :join_table => "kierunkowe_efekty_ksztalcenia_obszarowe_efekty_ksztalcenia", :class_name => "KierunkowyEfektKsztalcenia"
  belongs_to :obszar_ksztalcenia

  enum kategoria: {
      Wiedza: 0,
      Umiejetnosci: 1,
      Kompetencje: 2
  }

  enum stopien: {
      PierwszegoStopnia: 0,
      DrugiegoStopnia: 1,
      JednoliteMagisterskie: 2,
      Doktoranckie: 3
  }

  enum profil: {
      Ogolnoakademicki: 0,
      Praktyczny: 1
  }

end