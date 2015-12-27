class ModulKsztalcenia < ActiveRecord::Base
  belongs_to :program_studiow
  belongs_to :profil_modulu
  has_many :zajecias

  enum typ: {
      Obowiazkowy: 0,
      Opcjonalny: 1
  }
end
