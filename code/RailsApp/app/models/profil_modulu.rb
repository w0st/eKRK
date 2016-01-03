class ProfilModulu < ActiveRecord::Base
  has_many :moduly_ksztalcenia
  belongs_to :program_studiow
end
