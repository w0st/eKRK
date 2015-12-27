class Root < Grape::API

  prefix 'api'
  version 'v1', using: :path
  format :json

  mount Employee::Data
  mount Users::Data
  add_swagger_documentation   api_version: 'v1'

end
