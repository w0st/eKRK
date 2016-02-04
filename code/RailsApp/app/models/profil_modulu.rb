class ProfilModulu < ActiveRecord::Base
  has_many :moduly_ksztalcenia
  belongs_to :program_studiow

  validates :program_studiow, :presence => true
  validates :nazwa, presence: true, allow_blank: false, length: { minimum: 1 }
end
