module ProgramyKsztalcenia
  # Odpowiedzialna za ProgramyKsztalcenia
  class Data < Grape::API
    resource :programy_ksztalcenia do
      # Get a list of programy_ksztalcenia
      #
      # Example Request:
      #   GET /programy_ksztalcenia
      # TODO Obsluzyc tutaj relacje do kierunku studiow, wydzialu
      # aby uniknac zbyt duzej ilosci wywolan REST
      get do
        ProgramKsztalcenia.all
      end
    end
  end
end
