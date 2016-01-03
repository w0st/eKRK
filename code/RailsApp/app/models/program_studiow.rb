class ProgramStudiow < ActiveRecord::Base
  belongs_to :program_ksztalcenia
  has_many :zagadnienia_egzaminu_dyplomowego
  has_many :profile_modulow
  has_many :moduly_ksztalcenia

  enum uzyskiwanyTytul: {
      Magister: 0,
      Licencjat: 1,
      Inzynier: 2
  }
end
