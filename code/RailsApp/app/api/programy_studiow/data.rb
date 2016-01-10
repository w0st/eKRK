require 'doorkeeper/grape/helpers'
module ProgramyStudiow
  # Odpowiedzialna za ProgramyStudiow
  class Data < Grape::API
=begin
    helpers Doorkeeper::Grape::Helpers
    before do
      doorkeeper_authorize!
    end
=end
    resource :programy_studiow do
      # Get a list of programy_studiow
      #
      # Example Request:
      #   GET /programy_studiow
      get do
        ProgramStudiow.all
      end

      # Get a single program_studiow
      #
      # Parameters:
      #   id (required) - The ID of a program_studiow
      # Example Request:
      #   GET /programy_studiow/:id
      params do
        requires :id
      end
      get ':id' do
        ProgramStudiow.find(params[:id])
      end


    # Create a new program studiów
    #
    # Example Request:
    #   POST /v1/programy_studiow
      params do
        requires :liczbaSemestrow, type: String
        requires :zwiazekZMisjaUczelni, type: String
        requires :wymaganiaWstepne, type: String
        requires :uzyskiwanyTytul, type: Integer
        requires :sylwetkaAbsolwenta, type: String
        requires :liczbaSemestrow, type: Integer
        requires :ECTSdoKwalifikacji, type: Integer
        requires :mozliwoscKontynuacjiStudiow, type: String
        requires :zwiezlaAnalizaZRynkiem, type: String
        requires :program_ksztalcenia_id, type: Integer
      end
    post do
      programStudiow = ProgramStudiow.new(params)
      if programStudiow.save
        programStudiow
      else
        programStudiow.errors
      end
    end

    end
  end
end
