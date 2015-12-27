class ProfilModulu < ActiveRecord::Base
  has_many :modul_ksztalcenias
  belongs_to :program_studiow
end
