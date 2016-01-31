require 'doorkeeper/grape/helpers'
module PrzedmiotyKsztalcenia
  # Odpowiedzialna za ProgramyStudiow
  class Data < Grape::API
=begin
    helpers Doorkeeper::Grape::Helpers
    before do
      doorkeeper_authorize!
    end
=end
    resource :przedmioty_ksztalcenia do
      # Get a list of programy_ksztalcenia
      #
      # Example Request:
      #   GET /przedmioty_ksztalcenia
      get do
        PrzedmiotKsztalcenia.all
      end


      # Create a new przedmioty_ksztalcenia
      #
      # Example Request:
      #   POST /v1/przedmioty_ksztalcenia
      params do
        requires :nazwaPrzedmiotu, type: String
        requires :program_ksztalcenia_id, type: Integer
        requires :pracownik_naukowy_id, type: Integer
      end
      post do
        programKsztalcenia = PrzedmiotKsztalcenia.new(params)
        if programKsztalcenia.save
          programKsztalcenia
        else
          programKsztalcenia.errors
        end
      end

      # Updates przedmiot kształcenia
      #
      # Example Request:
      #   PUT /v1/przedmioty_ksztalcenia/:id
      params do
        requires :id
        requires :nazwaPrzedmiotu, type: String
        requires :program_ksztalcenia_id, type: Integer
        requires :pracownik_naukowy_id, type: Integer
      end
      put do
        programKsztalcenia = PrzedmiotKsztalcenia.find(params[:id])
        programKsztalcenia.assign_attributes(params)
        if programKsztalcenia.save
          programKsztalcenia
        else
          programKsztalcenia.errors
        end
      end

      # Deletes przedmiot kształcenia
      #
      # Example Request:
      #   DELETE /v1/przedmioty_ksztalcenia/:id
      params do
        requires :id
      end
      delete do
        PrzedmiotKsztalcenia.destroy(params[:id])
      end

    end
  end
end
