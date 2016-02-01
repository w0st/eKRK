class ModulKsztalcenia < ActiveRecord::Base
  belongs_to :program_studiow
  belongs_to :profil_modulu
  has_many :zajecia

  validates :program_studiow, :presence => true
  validates :profil_modulu, :presence => true
  validates :nazwaModulu, presence: true, allow_blank: false, length: { minimum: 1 }


  enum typ: {
      Obowiazkowy: 0,
      Opcjonalny: 1
  }
end
