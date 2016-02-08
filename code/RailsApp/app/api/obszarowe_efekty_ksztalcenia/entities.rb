require 'doorkeeper/grape/helpers'
module ObszaroweEfektyKsztalcenia
  # Odpowiedzialna za Prezentacje ObszaroweEfektyKsztalcenia
  module Entities
    class KierunkowyEfektKsztalcenia < Grape::Entity
      expose :id
      expose :kod
      expose :opis
      expose :kategoria
    end

    class ObszarowyEfektKsztalcenia < Grape::Entity
      expose :id
      expose :kod
      expose :opis
      expose :kategoria
      expose :stopien
      expose :profil
      expose :obszar_ksztalcenia_id
      expose :kierunkowe_efekty_ksztalcenia, using: ObszaroweEfektyKsztalcenia::Entities::KierunkowyEfektKsztalcenia
    end
  end
end
