class KierunekStudiow < ActiveRecord::Base
  has_many :program_ksztalcenias
  belongs_to :wydzial
end
