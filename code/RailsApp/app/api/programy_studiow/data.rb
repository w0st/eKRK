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
    end
  end
end
