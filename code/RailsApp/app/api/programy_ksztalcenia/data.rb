require 'doorkeeper/grape/helpers'
module ProgramyKsztalcenia
  # Odpowiedzialna za ProgramyKsztalcenia
  class Data < Grape::API
=begin
    helpers Doorkeeper::Grape::Helpers
    before do
      doorkeeper_authorize!
    end
=end
    resource :programy_ksztalcenia do
      # Get a list of programy_ksztalcenia
      #
      # Example Request:
      #   GET /programy_ksztalcenia
      get do
        ProgramKsztalcenia.all
      end

      # Get a single program_ksztalcenia
      #
      # Parameters:
      #   id (required) - The ID of a program_ksztalcenia
      # Example Request:
      #   GET /programy_ksztalcenia/:id
      params do
        requires :id
      end
      get ':id' do
        ProgramKsztalcenia.find(params[:id])
      end
    end
  end
end
