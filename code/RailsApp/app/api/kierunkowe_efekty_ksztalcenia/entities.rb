require 'doorkeeper/grape/helpers'
module KierunkoweEfektyKsztalcenia
  # Odpowiedzialna za Prezentacje KierunkoweEfektyKsztalcenia
  module Entities
    class ObszarowyEfektKsztalcenia < Grape::Entity
      expose :id
    end

    class KierunkowyEfektKsztalcenia < Grape::Entity
      expose :id
      expose :kod
      expose :opis
      expose :kategoria
      expose :program_ksztalcenia_id
      expose :obszarowe_efekty_ksztalcenia, using: KierunkoweEfektyKsztalcenia::Entities::ObszarowyEfektKsztalcenia
    end
  end
end
