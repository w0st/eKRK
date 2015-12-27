class KartaPrzedmiotu < ActiveRecord::Base
  belongs_to :przedmiot_ksztalcenia
  belongs_to :pracownik_naukowy
  has_many :przedmiotowy_efekt_ksztalcenias
end
