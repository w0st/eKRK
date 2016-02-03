require 'doorkeeper/grape/helpers'
module PracownicyNaukowi
  # Odpowiedzialna za KierunkoweEfektyKsztalcenia
  class Data < Grape::API
=begin
    helpers Doorkeeper::Grape::Helpers
    before do
      doorkeeper_authorize!
    end
=end
    resource :pracownicy_naukowi do
      # Get a list of kierunkowe_efekty_ksztalcenia
      #
      # Example Request:
      #   GET /kierunkowe_efekty_ksztalcenia
      desc 'Pokaż pracowników naukowych'
      get do
        PracownikNaukowy.all
      end
    end
  end
end
