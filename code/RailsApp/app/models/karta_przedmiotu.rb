class KartaPrzedmiotu < ActiveRecord::Base
  belongs_to :przedmiot_ksztalcenia
  belongs_to :autorKartyPrzedmiotu, :class_name => "PracownikNaukowy", :foreign_key => "pracownik_naukowy_id"
  has_many :przedmiotowe_efekty_ksztalcenia
end
