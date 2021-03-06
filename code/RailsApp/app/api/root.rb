# Klasa odpowiedzialna za cale API dla aplikacji Angularowej
class Root < Grape::API
  prefix 'api'
  version 'v1', using: :path
  format :json
  mount Employee::Data
  mount Users::Data
  mount ProgramyKsztalcenia::Data
  mount ObszaroweEfektyKsztalcenia::Data
  mount KierunkoweEfektyKsztalcenia::Data
  mount ProgramyStudiow::Data
  mount ZagadnieniaEgzaminuDyplomowego::Data
  mount ProfileModulow::Data
  mount PrzedmiotyKsztalcenia::Data
  mount ModulyKsztalcenia::Data
  mount PracownicyNaukowi::Data

  # mount Zajecia::Data powoduje
 # `combine_namespaces': undefined method `endpoints' for Data:Class (NoMethodError) jakis bug?
  mount ZajeciaModule::Data


  add_swagger_documentation(hide_documentation_path: true,
                            api_version: 'v1',
                            mount_path: 'swagger_doc'
                           )
end
