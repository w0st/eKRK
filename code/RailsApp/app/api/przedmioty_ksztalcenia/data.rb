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
      # Get a list of przedmioty_ksztalcenia
      #
      # Example Request:
      #   GET /przedmioty_ksztalcenia
      get do
        present PrzedmiotKsztalcenia.all, with: PrzedmiotyKsztalcenia::Entities::PrzedmiotKsztalcenia
      end

      # Get a przedmiot_ksztalcenia with id
      params do
        requires :id
      end
      get ':id' do
        present PrzedmiotKsztalcenia.find(params[:id]), with: PrzedmiotyKsztalcenia::Entities::PrzedmiotKsztalcenia
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
        przedmiotKsztalcenia = PrzedmiotKsztalcenia.new(params)
        if przedmiotKsztalcenia.save
          przedmiotKsztalcenia
        else
          przedmiotKsztalcenia.errors
        end
      end

      # Updates przedmiot kształcenia
      #
      # Example Request:
      #   PUT /v1/przedmioty_ksztalcenia
      params do
        requires :id
        requires :nazwaPrzedmiotu, type: String
        requires :program_ksztalcenia_id, type: Integer
        requires :pracownik_naukowy_id, type: Integer
      end
      put ':id' do
        przedmiotKsztalcenia = PrzedmiotKsztalcenia.find(params[:id])
        przedmiotKsztalcenia.assign_attributes(params)
        if przedmiotKsztalcenia.save
          przedmiotKsztalcenia
        else
          przedmiotKsztalcenia.errors
        end
      end

      # Deletes przedmiot kształcenia
      #
      # Example Request:
      #   DELETE /v1/przedmioty_ksztalcenia/:id
      delete ':id' do
        PrzedmiotKsztalcenia.destroy(params[:id])
      end

    end
  end
end
