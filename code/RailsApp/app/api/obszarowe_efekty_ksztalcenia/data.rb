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
      desc 'Pokaż obszarowe efekty kształcenia'
      get do
        efekty = ObszarowyEfektKsztalcenia.all
        present efekty, with: ObszaroweEfektyKsztalcenia::Entities::ObszarowyEfektKsztalcenia
      end
=begin
      {
          "powiazania":
              [
                  {
                      "kierunkowe_efekty_ksztalcenia":
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
          requires 'kierunkowe_efekty_ksztalcenia', type: Array do
            requires 'id', type: Integer
          end
          requires 'id', type: Integer
        end
      end
      # PUT is idempotent, so if you PUT an object twice, it has no effect.
      put :ustaw_powiazania do
        params.powiazania.each do |obszarowy|
          obszarowy_efekt = ObszarowyEfektKsztalcenia.find(obszarowy.id)
          kierunkowe_efekty_id = obszarowy.kierunkowe_efekty_ksztalcenia.collect do |kierunkowy|
            kierunkowy.id
          end
          obszarowy_efekt.kierunkowe_efekty_ksztalcenia = KierunkowyEfektKsztalcenia.find(kierunkowe_efekty_id)
        end
        params
      end
    end
  end
end
