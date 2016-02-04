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


    end
  end
end
