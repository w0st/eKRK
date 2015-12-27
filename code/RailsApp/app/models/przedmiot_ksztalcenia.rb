class PrzedmiotKsztalcenia < ActiveRecord::Base
  has_many :zajecias
  belongs_to :program_ksztalcenia
  has_and_belongs_to_many :kierunkowy_efekt_ksztalcenias
  has_many :karta_przedmiotus
  belongs_to :pracownik_naukowy

end
