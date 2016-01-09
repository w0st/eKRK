require 'doorkeeper/grape/helpers'
module KierunkoweEfektyKsztalcenia
  # Odpowiedzialna za KierunkoweEfektyKsztalcenia
  class Data < Grape::API
=begin
    helpers Doorkeeper::Grape::Helpers
    before do
      doorkeeper_authorize!
    end
=end
    resource :kierunkowe_efekty_ksztalcenia do
      # Get a list of kierunkowe_efekty_ksztalcenia
      #
      # Example Request:
      #   GET /kierunkowe_efekty_ksztalcenia
      get do
        efekty = KierunkowyEfektKsztalcenia.all
        present efekty, with: KierunkoweEfektyKsztalcenia::Entities::KierunkowyEfektKsztalcenia
      end
    end
  end
end
