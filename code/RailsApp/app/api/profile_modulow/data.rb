require 'doorkeeper/grape/helpers'
module ProfileModulow
  # Odpowiedzialna za ProgramyStudiow
  class Data < Grape::API
=begin
    helpers Doorkeeper::Grape::Helpers
    before do
      doorkeeper_authorize!
    end
=end
    resource :profile_modulow do

      desc "Lista wszystkich ProfiliModulow"
      # Example Request:
      #   GET /profile_modulow
      get do
        ProfilModulu.all
      end

      desc "Zwraca ProfilModulu dla podanego ID"
      # Example Request:
      #   GET /profile_modulow/:id
      params do
        requires :id
      end
      get ':id' do
        ProfilModulu.find(params[:id])
      end


      desc "Tworzy nowy ProfilModulu"
      # Example Request:
      #POST profile_modulow/":profil
      params do
        requires :nazwa, type: String
        requires :program_studiow_id, type: Integer
      end
      post do
        profil_modulu = ProfilModulu.new(params)
        if profil_modulu.save
          profil_modulu
        else
          error!(profil_modulu.errors, 400)
        end
      end

      desc "Updatuje ProfilModulu"
      # Example Request:
      #PUT profile_modulow/":profil
      params do
        requires :id
        requires :nazwa, type: String
      end
      put do
        profil_modulu = ProfilModulu.find(params[:id])
        profil_modulu.nazwa = params[:nazwa]
        if profil_modulu.save
          profil_modulu
        else
          error!(profil_modulu.errors, 400)
        end
      end

      desc "Usuwa ProfilModulu oraz przypisane do profilu moduly"
      # Example Request:
      #DELETE profile_modulow/":id
      params do
        requires :id
      end
      delete ':id' do
        profil = ProfilModulu.find(params[:id])
        profil.moduly_ksztalcenia.each do |modul|
          modul.destroy!
        end
        profil.destroy!
      end


      desc "Lista profili modolow dla danego programu ksztalcenia z przypisanymi modulami"
      # Parameters:
      #   program_ksztalcenia_id (required) - The id of program_ksztalcenia
      # Example Request:
      #   GET /profile_modulow/program_ksztalcenia_pk/:program_ksztalcenia_id
      params do
        requires :program_ksztalcenia_id
      end
      get 'program_ksztalcenia_pk/:program_ksztalcenia_id'  do
        profile = ProgramKsztalcenia.find(params[:program_ksztalcenia_id]).program_studiow.profile_modulow
        present profile, with: ProfileModulow::Entities::ProfilModulu
      end

    end
  end
end
