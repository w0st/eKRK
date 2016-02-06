require 'doorkeeper/grape/helpers'
module ZajeciaModule
  # Odpowiedzialna za ProgramyStudiow
  class Data < Grape::API
=begin
    helpers Doorkeeper::Grape::Helpers
    before do
      doorkeeper_authorize!
    end
=end
    resource :zajecia do

      get do
        Zajecia.all
      end


      desc 'Pokaz kursy z wybranym id'
      params do
        requires :id
      end
      get '/kurs/:id' do
        Kurs.find(params[:id])
      end


      desc 'Pokaz grupy kursów z wybranym id'
      params do
        requires :id
      end
      get '/grupa_kursow/:id' do
        GrupaKursow.find(params[:id])
      end


      desc "Lista zajec przypisanych do ModuluKsztalcenia z danego ProgramuKsztalcenia.
            W przypadku grupy kursow zwraca jedynie grupe bez kursow do niej przypisanych"
      # Example Request:
      #   GET /zajecia/from_module
      params do
        requires :program_ksztalcenia_id
        optional :modul_ksztalcenia_id, desc: "Jeśli wartość jest pusta zwraca zajecia nie przypisane do modulow"
      end
      get '/from_module'  do
        Zajecia.joins(przedmiot_ksztalcenia: :program_ksztalcenia)
            .where(programy_ksztalcenia:  {id: params[:program_ksztalcenia_id]},  :modul_ksztalcenia_id => params[:modul_ksztalcenia_id], :zajecia_id => nil)
      end

      desc 'Aktualizuj kurs'
      # Example Request:
      #   PUT /v1/kurs
      params do
        requires :id
        requires :kodZajec,  type: String
        requires :nazwaZajec,  type: String
        requires :punktyECTS, type: Integer
        requires :punktyECTSBK, type: Float
        requires :punktyECTSP, type: Integer
        requires :sposobZaliczenia, type: String
        requires :czyOgolnouczelniany,type: Virtus::Attribute::Boolean
        requires :rodzaj, type: String
        requires :typ, type: String
        requires :formaKursu, type: String
        requires :godzinyZZU, type: Integer
        requires :godzinyCNPS, type: Integer
      end
      put '/kurs' do
        kurs = Kurs.find(params[:id])
        kurs.assign_attributes(params)
        if kurs.save
          kurs
        else
          kurs.errors
        end
      end




      desc 'Usun wybrane zajecia (kurs bez GK / kurs z GK/ grupa kursow)'
      delete ':id' do
        Zajecia.destroy(params[:id])
      end


    end
  end
end
