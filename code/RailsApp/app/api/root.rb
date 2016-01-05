class Root < Grape::API

  prefix 'api'
  version 'v1', using: :path
  format :json

  mount Employee::Data
  mount Users::Data
  add_swagger_documentation(
      hide_documentation_path: true,
      api_version: 'v1',
      mount_path: 'swagger_doc',
  )

end
