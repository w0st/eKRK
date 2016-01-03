class ObszarKsztalcenia < ActiveRecord::Base
  has_many :obszarowe_efekty_ksztalcenia
  has_many :udzialy_obszarow
end
