require 'doorkeeper/grape/helpers'
module ProfileModulow

  module Entities

    class ModulKsztalcenia < Grape::Entity
      expose :id, :nazwaModulu, :typ
    end

    class ProfilModulu < Grape::Entity
      expose :id, :nazwa
      expose :moduly_ksztalcenia, using: ProfileModulow::Entities::ModulKsztalcenia
      end
  end
end

