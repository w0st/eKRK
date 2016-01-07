class ProgramKsztalcenia < ActiveRecord::Base
  has_many :udzialy_obszarow
  belongs_to :kierunek_studiow
  has_one :program_studiow
  has_one :plan_studiow
  has_many :przedmioty_ksztalcenia

  enum profil: {
      Ogolnoakademicki: 0,
      Praktyczny: 1
  }

  enum forma: {
      Stacjonarna: 0,
      Niestacjonarna: 1
  }

  enum poziomKsztalcenia: {
      JednoliteMagisterskie: 0,
      PierwszegoStopnia: 1,
      DrugiegoStopnia: 2,
      Doktoranckie: 3
  }

  def as_json(options={})
    super(
          :include => {
              :kierunek_studiow => {:include => :wydzial }
          }
    )
  end
end
