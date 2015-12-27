module Users
    class Data < Grape::API

      resource :users do
        # Get a list of users
        #
        # Example Request:
        #   GET /v1/users
        get do
          User.all
        end

        # Get a single user
        #
        # Parameters:
        #   id (required) - The ID of a user
        # Example Request:
        #   GET /v1/users/:id
        params do
          requires :id
        end
        get ':id' do
          User.find(params[:id])
        end

        # Create a new user
        #
        # Example Request:
        #   POST /v1/users
        post do
          user = User.new(params)
          if user.save
            user
          else
            user.errors
          end
        end

        # Edit a user
        #
        # Example Request:
        #   PUT /v1/users/:id
        params do
          requires :id
        end
        put ':id' do
          user = User.find(params[:id])
          if user.update(params)
            user
          else
            user.errors
          end
        end

        # Delete a user
        #
        # Example Request:
        #   DELETE /v1/users/:id
        params do
          requires :id
        end
        delete ':id' do
          User.destroy(params[:id])
        end
      end
    end
end
