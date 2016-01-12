class PrzedmiotKsztalcenia < ActiveRecord::Base
  has_many :zajecia
  belongs_to :program_ksztalcenia
  has_and_belongs_to_many :kierunkowe_efekty_ksztalcenia,
                          :join_table => "kierunkowe_efekty_ksztalcenia_przedmioty_ksztalcenia",
                          :class_name => "KierunkowyEfektKsztalcenia",
                          :uniq => true
  has_many :karty_przedmiotow
  belongs_to :opiekunPrzedmiotu , :class_name => "PracownikNaukowy", :foreign_key => "pracownik_naukowy_id"

end
