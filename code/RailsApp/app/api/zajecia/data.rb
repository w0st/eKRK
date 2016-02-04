require 'doorkeeper/grape/helpers'
module Zajecia
  class Data < Grape::API
=begin
    helpers Doorkeeper::Grape::Helpers
    resource :current_user do
      # Get a current user
      get do
        User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      end
    end
=end


    resource :zajecia do
      # Get a list of users
      #
      # Example Request:
      #   GET /v1/zajecia
      get do
        Zajecia.all
      end

      # Get a single user
      #
      # Parameters:
      #   id (required) - The ID of a user
      # Example Request:
      #   GET /v1/zajecia/:id
      params do
        requires :id
      end
      get ':id' do
        Zajecia.find(params[:id])
      end

    end
  end
end
