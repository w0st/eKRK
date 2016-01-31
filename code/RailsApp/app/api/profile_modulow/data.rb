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
      # Get a list of profile_modulow
      #
      # Example Request:
      #   GET /profile_modulow
      get do
        ProfilModulu.all
      end

      # Get a single program_studiow
      #
      # Parameters:
      #   id (required) - The ID of a program_studiow
      # Example Request:
      #   GET /profile_modulow/:id
      params do
        requires :id
      end

      get ':id' do
        ProfilModulu.find(params[:id])
      end

      params do
        requires :nazwa, type: String
        requires :program_studiow_id, type: Integer
      end
      post do
        profil_modulu = ProfilModulu.new(params)
        if profil_modulu.save
          profil_modulu
        else
          profil_modulu.errors
        end
      end

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
