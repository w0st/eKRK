class KierunekStudiow < ActiveRecord::Base
  has_many :programy_ksztalcenia
  belongs_to :wydzial
end
