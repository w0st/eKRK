require 'doorkeeper/grape/helpers'
module ObszaroweEfektyKsztalcenia
  # Odpowiedzialna za ObszaroweEfektyKsztalcenia
  class Data < Grape::API
=begin
    helpers Doorkeeper::Grape::Helpers
    before do
      doorkeeper_authorize!
    end
=end
    resource :obszarowe_efekty_ksztalcenia do
      # Get a list of obszarowe_efekty_ksztalcenia
      #
      # Example Request:
      #   GET /obszarowe_efekty_ksztalcenia
      get do
        efekty = ObszarowyEfektKsztalcenia.all
        present efekty, with: ObszaroweEfektyKsztalcenia::Entities::ObszarowyEfektKsztalcenia
      end
=begin
      {
          "powiazania":
              [
                  {
                      "kierunkowe_efekty":
                          [
                              {
                                  "id": 1
                              },
                              {
                                  "id": 2
                              }
                          ],
                      "id": 3
                  }
              ]
      }
=end
      desc 'Macierz śladowania'
      params do
        requires 'powiazania', type: Array do
          requires 'kierunkowe_efekty', type: Array do
            requires 'id', type: Integer
          end
          requires 'id', type: Integer
        end
      end
      put :ustaw_powiazania do
        params
      end
    end
  end
end
