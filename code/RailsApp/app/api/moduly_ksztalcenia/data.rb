require 'doorkeeper/grape/helpers'
module ModulyKsztalcenia
  # Odpowiedzialna za ProgramyStudiow
  class Data < Grape::API
=begin
    helpers Doorkeeper::Grape::Helpers
    before do
      doorkeeper_authorize!
    end
=end
    resource :moduly_ksztalcenia do

      desc "Lista wszystkich ModulowKsztalcenia"
      # Example Request:
      #   GET /moduly_ksztalcenia
      get do
        ModulKsztalcenia.all
      end


      desc "ModoluKsztalcenia dla podanego ID"
      # Parameters:
      #   id (required) - The ID of a moduly_ksztalcenia
      # Example Request:
      #   GET /moduly_ksztalcenia/:id
      params do
        requires :id
      end
      get ':id' do
        ModulKsztalcenia.find(params[:id])
      end


      desc "Tworzenie nowego ModuluKsztalcenia"
      # Example Request:
      #   POST /moduly_ksztalcenia/:modul
      params do
        requires :nazwaModulu, type: String
        requires :typ, type: String
        requires :minEcts, type: Integer
        requires :program_studiow_id, type: Integer
        requires :profil_modulu_id, type: Integer
      end
      post do
        modul = ModulKsztalcenia.new(params)
        if modul.save
          modul
        else
          modul.errors
        end
      end

      desc "Zmiana ModuluKsztalcenia"
      # Example Request:
      #   POST /moduly_ksztalcenia/:modul
      params do
        requires :id
        requires :nazwaModulu, type: String
        requires :typ, type: String
        requires :minEcts, type: Integer
      end
      put do
        modul = ModulKsztalcenia.find(params[:id])
        modul.assign_attributes(params)
        if modul.save
          modul
        else
          modul.errors
        end
      end


      desc "Usuwa ModulKsztalcenia"
      # Example Request:
      #   DELETE /moduly_ksztalcenia/:id
      params do
        requires :id
      end
      delete ':id' do
        ModulKsztalcenia.find(params[:id]).destroy!
      end

    end
  end
end
