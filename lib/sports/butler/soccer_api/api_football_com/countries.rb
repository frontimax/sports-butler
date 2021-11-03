# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApiFootballCom
        class Countries
          PATH = :countries

          # TODO: Base!
          attr_accessor :object

          def initialize(object)
            @object = object
          end

          # /countries
          def all
            api = Api.new(object.sport, object.api)
            api.get(path: PATH)
          end

        end
      end
    end
  end
end
