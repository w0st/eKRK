class ProgramKsztalcenia < ActiveRecord::Base
  has_many :udzial_obszarus
  belongs_to :kierunek_studiow
  has_one :program_studiow
  has_one :plan_studiow
  has_many :przedmiot_ksztalcenias

  enum profil: {
      Ogolnoakademicki: 0,
      Praktyczny: 1
  }

  enum forma: {
      Stacjonarna: 0,
      Niestacjonarna: 1
  }

end
