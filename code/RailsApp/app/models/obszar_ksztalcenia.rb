class ObszarKsztalcenia < ActiveRecord::Base
  has_many :obszarowy_efekt_ksztalcenias
  has_many :udzial_obszarus
end
