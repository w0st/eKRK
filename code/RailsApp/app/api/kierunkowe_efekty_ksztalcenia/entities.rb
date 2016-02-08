require 'doorkeeper/grape/helpers'
module KierunkoweEfektyKsztalcenia
  # Odpowiedzialna za Prezentacje KierunkoweEfektyKsztalcenia
  module Entities
    class KierunkowyEfektKsztalcenia < Grape::Entity
      expose :id
      expose :kod
      expose :opis
      expose :kategoria
    end
  end
end
