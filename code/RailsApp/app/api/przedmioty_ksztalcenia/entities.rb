require 'doorkeeper/grape/helpers'
module PrzedmiotyKsztalcenia
  # Odpowiedzialna za Prezentacje ObszaroweEfektyKsztalcenia
  module Entities
    class PracownikNaukowy < Grape::Entity
      expose :id
      expose :imie
      expose :nazwisko
      expose :email
    end

    class PrzedmiotKsztalcenia < Grape::Entity
      expose :id
      expose :nazwaPrzedmiotu
      expose :program_ksztalcenia_id
      expose :pracownik_naukowy_id
      expose :opiekunPrzedmiotu, using: PrzedmiotyKsztalcenia::Entities::PracownikNaukowy
    end
  end
end
