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
            .where(programy_ksztalcenia:  {id: params[:program_ksztalcenia_id]},  :modul_ksztalcenia_id => params[:modul_ksztalcenia_id], :grupa_kursow_id => nil)
      end


      desc 'Dodaj kurs'
      # Example Request:
      #   PUT /v1/kurs
      params do
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
        requires :przedmiot_ksztalcenia_id, type: Integer
        optional :zajecia_id, type: Integer
      end
      post '/kurs' do
        kurs = Kurs.new(params)
        if kurs.save
          kurs
        else
          error!(kurs.errors, 409)
        end
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
          error!(kurs.errors, 409)
        end
      end


      desc 'Aktualizuj grupe-kursow'
      # Example Request:
      #   POST /v1/grupa-kursow
      params do
        requires :kodZajec,  type: String
        requires :nazwaZajec,  type: String
        requires :punktyECTS, type: Integer
        requires :punktyECTSBK, type: Float
        requires :punktyECTSP, type: Integer
        requires :sposobZaliczenia, type: String
        requires :czyOgolnouczelniany,type: Virtus::Attribute::Boolean
        requires :rodzaj, type: String
        requires :typ, type: String
        requires :kurs_koncowy_id, type: Integer
        requires :przedmiot_ksztalcenia_id, type: Integer
        requires :kursy, type: Array do
          requires :id, type: Integer
          requires :formaKursu, type: String
          requires :godzinyZZU, type: Integer
          requires :godzinyCNPS, type: Integer
        end
      end
      post '/grupa_kursow' do
        pk =PrzedmiotKsztalcenia.find(params[:przedmiot_ksztalcenia_id])
        gk = GrupaKursow.new({kodZajec: params[:kodZajec],
                              nazwaZajec: params[:nazwaZajec],
                              punktyECTS: params[:punktyECTS],
                              punktyECTSBK: params[:punktyECTSBK],
                              punktyECTSP: params[:punktyECTSP],
                              sposobZaliczenia: params[:sposobZaliczenia],
                              czyOgolnouczelniany: params[:czyOgolnouczelniany],
                              rodzaj: params[:rodzaj],
                              typ: params[:typ]})
        pk.zajecia << gk
        kursyToUpdate = params[:kursy].select{|kurs| kurs[:id] >= 0}
        puts('ToUpdate')
        puts(kursyToUpdate)
        kursyToSave = params[:kursy].select{|kurs| kurs[:id] < 0}
        puts('ToSave')
        puts(kursyToSave)
        gk.kursy.clear

        kursKoncowy = nil

        #aktualizuj istniejace
        kursyToUpdate.each do |z|
          kursToUpdate = Kurs.find(z.id)
          kursToUpdate.assign_attributes(z)
          gk.kursy << kursToUpdate
          if z.id == params[:kurs_koncowy_id]
            gk.kurs_koncowy = kursToUpdate
          end
        end

        # dodaj nowe kursy
        kursyToSave.each do |z|
          if z.id == params[:kurs_koncowy_id]
            z.id = nil
            newKurs = Kurs.new(z)
            newKurs.save
            gk.kurs_koncowy = newKurs
            gk.kursy << newKurs
          else
            z.id = nil
            newKurs = Kurs.new(z)
            newKurs.save
            gk.kursy << newKurs
          end
        end

        if gk.save
          #Usuwa wszystkie usuniete z grupy kursow
          Kurs.where(kodZajec: nil, grupa_kursow_id: nil).destroy_all
          gk
        else
          gk.errors
        end
      end


      desc 'Aktualizuj grupe-kursow'
      # Example Request:
      #   PUT /v1/grupa-kursow
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
        requires :kurs_koncowy_id, type: Integer
        requires :kursy, type: Array do
          requires :id, type: Integer
          requires :formaKursu, type: String
          requires :godzinyZZU, type: Integer
          requires :godzinyCNPS, type: Integer
        end
      end
      put '/grupa_kursow' do
        gk = GrupaKursow.find(params[:id])
        gk.assign_attributes({kodZajec: params[:kodZajec],
                              nazwaZajec: params[:nazwaZajec],
                              punktyECTS: params[:punktyECTS],
                              punktyECTSBK: params[:punktyECTSBK],
                              punktyECTSP: params[:punktyECTSP],
                              sposobZaliczenia: params[:sposobZaliczenia],
                              czyOgolnouczelniany: params[:czyOgolnouczelniany],
                              rodzaj: params[:rodzaj],
                              typ: params[:typ]})
        puts(params[:kursy])
        puts(params[:kurs_koncowy_id])
        kursyToUpdate = params[:kursy].select{|kurs| kurs[:id] >= 0}
        puts('ToUpdate')
        puts(kursyToUpdate)
        kursyToSave = params[:kursy].select{|kurs| kurs[:id] < 0}
        puts('ToSave')
        puts(kursyToSave)


        newKursArray = []
        #aktualizuj istniejace
        kursyToUpdate.each do |z|
          kursToUpdate = Kurs.find(z.id)
          kursToUpdate.assign_attributes(z)
          newKursArray << kursToUpdate
          if z.id == params[:kurs_koncowy_id]
            gk.kurs_koncowy = kursToUpdate
          end
        end

        # dodaj nowe kursy
        kursyToSave.each do |z|
          if z.id == params[:kurs_koncowy_id]
            z.id = nil
            newKurs = Kurs.new(z)
            newKurs.save
            gk.kurs_koncowy = newKurs
            newKursArray << newKurs
          else
            z.id = nil
            newKurs = Kurs.new(z)
            newKurs.save
            newKursArray << newKurs
          end
        end

        gk.kursy = newKursArray
        puts('new Kursy')
        puts(newKursArray)

        if gk.save
          #Usuwa wszystkie usuniete z grupy kursow
          Kurs.where(kodZajec: nil, grupa_kursow_id: nil).destroy_all
          gk
        else
          gk.errors
        end
      end

      desc 'Usun wybrane zajecia (kurs bez GK / kurs z GK/ grupa kursow)'
      delete ':id' do
        Zajecia.destroy(params[:id])
      end

    end
  end
end
