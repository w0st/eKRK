class ProgramStudiow < ActiveRecord::Base
  has_one :program_ksztalcenia
  has_many :zagadnienie_egzaminu_dyplomowegos
  has_many :profil_modulus
  has_many :modul_ksztalcenias

  enum uzyskiwanyTytul: {
      Magister: 0,
      Licencjat: 1,
      Inzynier: 2
  }
end
