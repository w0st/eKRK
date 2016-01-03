class PrzedmiotKsztalcenia < ActiveRecord::Base
  has_many :zajecia
  belongs_to :program_ksztalcenia
  has_and_belongs_to_many :kierunkowe_efekty_ksztalcenia
  has_many :karty_przedmiotow
  belongs_to :pracownik_naukowy

end
