class PracownikNaukowy < ActiveRecord::Base
  has_many :przedmiot_ksztalcenias
  has_many :karta_przedmiotus
end
