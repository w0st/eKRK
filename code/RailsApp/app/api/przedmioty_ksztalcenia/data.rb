require 'doorkeeper/grape/helpers'
module PrzedmiotyKsztalcenia
  # Odpowiedzialna za ProgramyStudiow
  class Data < Grape::API
=begin
    helpers Doorkeeper::Grape::Helpers
    before do
      doorkeeper_authorize!
    end
=end
    resource :przedmioty_ksztalcenia do
      desc 'Pokaz wszystkie przedmioty ksztalcenia'
      # Example Request:
      #   GET /przedmioty_ksztalcenia
      get do
        present PrzedmiotKsztalcenia.all, with: PrzedmiotyKsztalcenia::Entities::PrzedmiotKsztalcenia
      end

      desc 'Pokaz przedmiot ksztalcenia z wybranym id'
      params do
        requires :id
      end
      get ':id' do
        present PrzedmiotKsztalcenia.find(params[:id]), with: PrzedmiotyKsztalcenia::Entities::PrzedmiotKsztalcenia
      end


      desc 'Utworz nowy przedmiot ksztalcenia'
      # Example Request:
      #   POST /v1/przedmioty_ksztalcenia
      params do
        requires :nazwaPrzedmiotu, type: String
        requires :program_ksztalcenia_id, type: Integer
        requires :pracownik_naukowy_id, type: Integer
      end
      post do
        przedmiotKsztalcenia = PrzedmiotKsztalcenia.new(params)
        if przedmiotKsztalcenia.save
          przedmiotKsztalcenia
        else
          przedmiotKsztalcenia.errors
        end
      end

      desc 'Aktualizuj przedmiot ksztalcenia'
      # Example Request:
      #   PUT /v1/przedmioty_ksztalcenia
      params do
        requires :id
        requires :nazwaPrzedmiotu, type: String
        requires :program_ksztalcenia_id, type: Integer
        requires :pracownik_naukowy_id, type: Integer
      end
      put ':id' do
        przedmiotKsztalcenia = PrzedmiotKsztalcenia.find(params[:id])
        przedmiotKsztalcenia.assign_attributes(params)
        if przedmiotKsztalcenia.save
          przedmiotKsztalcenia
        else
          przedmiotKsztalcenia.errors
        end
      end

      desc 'Usun wybrany przedmiot ksztalcenia'
      # Example Request:
      #   DELETE /v1/przedmioty_ksztalcenia/:id
      delete ':id' do
        PrzedmiotKsztalcenia.destroy(params[:id])
      end

      desc 'Pokaz kursy dla danego przedmiotu ksztalcenia (bez tych z GK)'
      get ':id/kursy' do
        przedmiot = PrzedmiotKsztalcenia.find(params[:id])
        przedmiot.zajecia.select {|z| z.is_a? Kurs and z.grupa_kursow == nil }
      end

      desc 'Pobierz GK dla danego przedmiotu ksztalcenia (wraz z kursami nalezacymi do GK)'
      get ':id/grupa_kursow' do
        przedmiot = PrzedmiotKsztalcenia.find(params[:id])
        gk = przedmiot.zajecia.find {|z| z.is_a? GrupaKursow}
        #gk.kursy
        present gk, with: PrzedmiotyKsztalcenia::Entities::GrupaKursow
      end

    end
  end
end
