class PracownikNaukowy < ActiveRecord::Base
  has_many :przedmioty_ksztalcenia
  has_many :karty_przedmiotow
end
