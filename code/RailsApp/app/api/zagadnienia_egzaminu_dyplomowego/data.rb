require 'doorkeeper/grape/helpers'
module ZagadnieniaEgzaminuDyplomowego
  # Odpowiedzialna za ZagadnieniaEgzaminuDyplomowego
  class Data < Grape::API
=begin
    helpers Doorkeeper::Grape::Helpers
    before do
      doorkeeper_authorize!
    end
=end
    resource :zagadnienia_egzaminu_dyplomowego do
    # Create a new zagadnienie egzaminu dyplomowego
    #
    # Example Request:
    #   POST /v1/zagadnienia_egzaminu_dyplomowego
    params do
      requires :zagadnienie, type: String
      requires :program_studiow_id, type: Integer
    end
    post do
      zagadnienieEgzaminuDyplomowego = ZagadnienieEgzaminuDyplomowego.new(params)
      if zagadnienieEgzaminuDyplomowego.save
        zagadnienieEgzaminuDyplomowego
      else
        zagadnienieEgzaminuDyplomowego.errors
      end
    end

    # Delete zagadnienie egzaminu dyplomowego
    #
    # Example Request:
    #   DELETE /v1/zagadnienia_egzaminu_dyplomowego/:id
    params do
      requires :id
    end
    delete ':id' do
      ZagadnienieEgzaminuDyplomowego.destroy(params[:id])
    end

    end
  end
end
