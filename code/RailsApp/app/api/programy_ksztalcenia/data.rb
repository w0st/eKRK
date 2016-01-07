module ProgramyKsztalcenia
  # Odpowiedzialna za ProgramyKsztalcenia
  class Data < Grape::API
    resource :programy_ksztalcenia do
      # Get a list of programy_ksztalcenia
      #
      # Example Request:
      #   GET /programy_ksztalcenia
      get do
        ProgramKsztalcenia.all
      end
    end
  end
end
