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

    class Kurs < Grape::Entity
      expose :id
      expose :godzinyZZU
      expose :godzinyCNPS
      expose :formaKursu
      expose :grupa_kursow_id
    end

    class GrupaKursow < Grape::Entity
      expose :id
      expose :kodZajec
      expose :nazwaZajec
      expose :punktyECTS
      expose :punktyECTSBK
      expose :punktyECTSP
      expose :sposobZaliczenia
      expose :czyOgolnouczelniany
      expose :rodzaj
      expose :typ
      expose :kurs_koncowy, using: PrzedmiotyKsztalcenia::Entities::Kurs
      expose :kursy, using: PrzedmiotyKsztalcenia::Entities::Kurs
    end

  end
end